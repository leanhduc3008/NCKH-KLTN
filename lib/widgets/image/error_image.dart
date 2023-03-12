import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
    this.width,
    this.height,
    this.isRounded = false,
    this.borderRadius,
  });

  final double? width, height;
  final bool isRounded;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        shape: isRounded ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: borderRadius,
      ),
      child: Icon(
        FontAwesomeIcons.ban,
        size: (height ?? width ?? Dimens.s10) - Dimens.s2,
        color: context.colorScheme.primary,
      ),
    );
  }
}
