import 'dart:collection';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

// * check if [radius] / [radii] are not too big?
// * use [Path.arcToPoint] so [radius] (and [radii]) can be specified as [Radius]

/// Return a [Path] that describes a polygon with "rounded" corners
/// defined by [points] and [radii] / [radius].
///
/// The corners are defined by [points] list. It can contain either:
/// * [Offset] for an absolute point
/// * [Offset.relative] for a relative point
///
/// For example: [Offset(100, 100), Offset(20, 0).relative, Offset(0, 30).relative]
/// is equal to [Offset(100, 100), Offset(120, 100), Offset(120, 130)]
///
/// You have to specify either [radii] or [radius] parameters but not both.
/// When using [radii] its length must match the length of [points] list.
Path roundPolygon({
  required List<Offset> points,
  List<double>? radii,
  double? radius,
}) {
  assert((radii == null) ^ (radius == null),
      'either radii or radius has to be specified (but not both)');
  assert(radii == null || radii.length == points.length,
      'if radii list is specified, its size has to match points list size');
  radii ??= List.filled(points.length, radius!);

  final List<Offset> absolutePoints;
  if (!points.any((point) => point is _RelativeOffset)) {
    // no relative [Offset] in [points]
    absolutePoints = points;
  } else {
    // at least one relative [Offset]
    Offset prevPoint = Offset.zero;
    absolutePoints = points.map((point) {
      return prevPoint = point is _RelativeOffset ? prevPoint + point : point;
    }).toList();
  }

  final p = absolutePoints.cycled();

  final directions = p
      .mapIndexed((int index, ui.Offset point) {
        final delta = p[index + 1] - point;
        assert(delta != Offset.zero,
            'any two adjacent points have to be different');
        return delta.direction;
      })
      .toList()
      .cycled();

  final angles = p.mapIndexed((int index, ui.Offset point) {
    final nextDelta = p[index + 1] - point;
    final prevDelta = p[index - 1] - point;
    final angle = prevDelta.direction - nextDelta.direction;
    assert(radii![index] == 0 || angle != 0);
    return angle;
  }).toList();

  final distances = angles.mapIndexed((i, a) {
    return radii![i] / math.sin(a / 2);
  });

  final path = Path();
  int i = 0;
  for (final distance in distances) {
    if (radii[i] != 0) {
      // round corner
      final direction = directions[i] + angles[i] / 2;
      // if normalizedAngle > pi, it means 'concave' corner
      final normalizedAngle = angles[i] % (2 * math.pi);
      final center = p[i] +
          Offset.fromDirection(
              direction, normalizedAngle < math.pi ? distance : -distance);

      final rect = Rect.fromCircle(center: center, radius: radii[i]);
      final startAngle = directions[i - 1] +
          (normalizedAngle < math.pi ? 1.5 * math.pi : -1.5 * math.pi);
      final sweepAngle =
          (normalizedAngle < math.pi ? math.pi : -math.pi) - angles[i];

      path.arcTo(rect, startAngle, sweepAngle, i == 0);
    } else {
      // sharp corner
      i == 0 ? path.moveTo(p[i].dx, p[i].dy) : path.lineTo(p[i].dx, p[i].dy);
    }
    i++;
  }
  return path..close();
}

extension RelativeOffsetExtension on Offset {
  Offset get relative => _RelativeOffset(dx, dy);
}

class _RelativeOffset extends Offset {
  _RelativeOffset(super.dx, super.dy);
}

typedef PathBuilder = ui.Path Function(ui.Rect bounds, double phase);
typedef OnPaintFrame = void Function(
    Canvas canvas, ui.Rect bounds, double phase);

/// Simple [OutlinedBorder] implementation.
/// You can use [PathBuilderBorder] directly in the build tree:
/// ```dart
/// child: Card(
///   shape: PathBuilderBorder(
///     pathBuilder: (r, phase) => roundPolygon(
///       points: [r.topLeft, r.topRight, r.centerRight, r.bottomCenter, r.centerLeft],
///       radii: [8, 8, 8, 32, 8],
///     ),
///   ),
///   ...
/// ```
/// Optional [phase] parameter can be used to 'morph' [PathBuilderBorder] if
/// it is used by widgets that animate their shape (like [AnimatedContainer] or [Material]).
/// In such case it is passed to [pathBuilder] as an interpolation between the old
/// and new value:
/// ```dart
/// int idx = 0;
///
/// @override
/// Widget build(BuildContext context) {
///   return Material(
///     clipBehavior: Clip.antiAlias,
///     shape: PathBuilderBorder(
///       pathBuilder: _phasedPathBuilder,
///       phase: idx.toDouble(),
///     ),
///     color: idx == 0? Colors.teal : Colors.orange,
///     child: InkWell(
///       onTap: () => setState(() => idx = idx ^ 1),
///       child: const Center(child: Text('press me', textScaleFactor: 2)),
///     ),
///   );
/// }
///
/// Path _phasedPathBuilder(Rect bounds, double phase) {
///   print(phase);
///   final radius = phase * rect.shortestSide / 2;
///   return Path()
///     ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
/// }
/// ```
///
/// You can also extend [PathBuilderBorder] if you want to add some
/// customizations, like [dimensions], [paint] etc.
class PathBuilderBorder extends OutlinedBorder {
  const PathBuilderBorder({
    required this.pathBuilder,
    super.side,
    this.phase = 0,
    this.painter,
    this.foregroundPainter,
  });

  final PathBuilder pathBuilder;
  final double phase;
  final OnPaintFrame? painter;
  final OnPaintFrame? foregroundPainter;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is PathBuilderBorder && phase != a.phase) {
      return PathBuilderBorder(
        pathBuilder: pathBuilder,
        side: side == a.side ? side : BorderSide.lerp(a.side, side, t),
        phase: ui.lerpDouble(a.phase, phase, t)!,
        painter: painter,
        foregroundPainter: foregroundPainter,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ui.Path getInnerPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  ui.Path getOuterPath(ui.Rect rect, {ui.TextDirection? textDirection}) {
    return pathBuilder(rect, phase);
  }

  @override
  void paint(ui.Canvas canvas, ui.Rect rect,
      {ui.TextDirection? textDirection}) {
    painter?.call(canvas, rect, phase);
    if (side != BorderSide.none) {
      canvas.drawPath(pathBuilder(rect, phase), side.toPaint());
    }
    foregroundPainter?.call(canvas, rect, phase);
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return PathBuilderBorder(
      pathBuilder: pathBuilder,
      side: side ?? this.side,
      phase: phase,
      painter: painter,
      foregroundPainter: foregroundPainter,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is PathBuilderBorder && other.phase == phase;
  }

  @override
  int get hashCode => phase.hashCode;
}

// double toDegrees(a) => a * 180 / pi;

extension _CyclicListExtension<T> on List<T> {
  List<T> cycled() => _CyclicList<T>(this);
}

class _CyclicList<T> with ListMixin<T> {
  _CyclicList(this.list);

  List<T> list;

  @override
  int get length => list.length;

  @override
  set length(int newLength) =>
      throw UnsupportedError('setting length not supported');

  @override
  T operator [](int index) => list[index % list.length];

  @override
  void operator []=(int index, value) =>
      throw UnsupportedError('indexed assignmnet not supported');
}
