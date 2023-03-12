/// Doc:
/// 1. https://stackoverflow.com/questions/70650773/flutter-i-want-to-show-dropdown-list-under-dropdown-flutter
/// 2. https://gist.github.com/pskink/adf730167a48b750a81f1dd197309312#file-round_polygon-dart-L126
import 'package:flutter/material.dart';

import '../../../common/extension/extenstion.dart';
import '../../common/constants/dimens.dart';
import '../path_builder.dart';

typedef AppDropDownButtonItemBuilder = Widget Function(
  BuildContext context,
  int index,
  VoidCallback closePopup,
);

class AppDropdownButton extends StatefulWidget {
  const AppDropdownButton({
    super.key,
    required this.child,
    required this.itemBuilder,
    required this.itemCount,
    this.padding = const EdgeInsets.all(8),
    this.physics = const NeverScrollableScrollPhysics(),
    this.shrinkWrap = true,
    this.width,
    this.height,
    this.onChanged,
  });

  final Widget child;
  final AppDropDownButtonItemBuilder itemBuilder;
  final int itemCount;
  final ValueChanged<bool>? onChanged;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final double? width;
  final double? height;

  @override
  State<AppDropdownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropdownButton> {
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _addOverlay() {
    _isOpen = true;
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry);
    if (widget.onChanged != null) {
      widget.onChanged!(_isOpen);
    }
    setState(() {});
  }

  void _removeOverlay() {
    _isOpen = false;
    _overlayEntry.remove();
    if (widget.onChanged != null) {
      widget.onChanged!(_isOpen);
    }
    setState(() {});
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox?;

    return OverlayEntry(
      builder: (context) => Align(
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, Dimens.s1),
          followerAnchor: Alignment.topCenter,
          targetAnchor: Alignment.bottomCenter,
          child: Container(
            width: widget.width ?? renderBox?.size.width,
            height: widget.height,
            padding: const EdgeInsets.only(top: _vertexSize),
            decoration: ShapeDecoration(
              shape: PathBuilderBorder(
                pathBuilder: _pathBuilder,
                side: BorderSide(color: context.colorScheme.primary),
              ),
              color: context.colorScheme.background,
              shadows: [
                BoxShadow(
                  color: context.colorScheme.primary.withOpacity(.24),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Material(
              type: MaterialType.transparency,
              child: ListView.builder(
                padding: widget.padding,
                physics: widget.physics,
                shrinkWrap: widget.shrinkWrap,
                itemBuilder: (context, index) {
                  return widget.itemBuilder(context, index, _removeOverlay);
                },
                itemCount: widget.itemCount,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isOpen ? _removeOverlay : _addOverlay,
      child: CompositedTransformTarget(link: _layerLink, child: widget.child),
    );
  }

  Path _pathBuilder(Rect bounds, double phase) {
    final rect = bounds.topLeft & Size(bounds.width, _vertexSize);
    final vertex = rect.topRight - const Offset(_vertexMarignRight, 0);

    return roundPolygon(
      // indices:
      //                4
      //              /   \
      // 2-----------3     5---6
      // |
      // |
      // 1---------------------0
      //
      points: [
        bounds.bottomRight,
        bounds.bottomLeft,
        rect.bottomLeft,
        vertex + const Offset(-_vertexSize, _vertexSize),
        vertex,
        vertex + const Offset(_vertexSize, _vertexSize),
        rect.bottomRight,
      ],
      radii: [
        10,
        10,
        10,
        0,
        0,
        0,
        10,
      ],
    );
  }

  static const double _vertexSize = Dimens.s2;
  static const double _vertexMarignRight = Dimens.s5;
}
