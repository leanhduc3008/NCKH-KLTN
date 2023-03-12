import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/context_extension.dart';
import '../image/rounded_rect_image.dart';

class BaseCardVertical extends StatelessWidget {
  const BaseCardVertical({
    super.key,
    required this.content,
    this.leading,
    this.leadingGap = Dimens.s3,
    this.trailing,
    this.trailingGap = Dimens.s3,
    this.bottomGap = 0,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(Dimens.s3),
    this.margin,
    this.borderRadius,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.decoration,
  });

  factory BaseCardVertical.image({
    Key? key,
    required String imageUrl,
    required Widget content,
    EdgeInsetsGeometry padding = const EdgeInsets.all(Dimens.s3),
    Widget? leading,
    double leadingGap = Dimens.s3,
    Widget? trailing,
    double trailingGap = Dimens.s3,
    double bottomGap = 0,
    double? height,
    double? heightImage,
    double? width,
  }) {
    return BaseCardVertical(
      key: key,
      padding: EdgeInsets.zero,
      leading: RoundedRectImage(
        imageURL: imageUrl,
        height: heightImage,
        width: double.infinity,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(Dimens.s3)),
      ),
      content: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (leading != null) ...<Widget>[
              leading,
              SizedBox(width: leadingGap),
            ],
            content,
          ],
        ),
      ),
      trailing: trailing,
      trailingGap: trailingGap,
      bottomGap: bottomGap,
      height: height,
      width: width,
    );
  }

  final Widget? leading;
  final double leadingGap;
  final Widget content;
  final double trailingGap;
  final Widget? trailing;
  final double bottomGap;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3),
              boxShadow: [
                BoxShadow(
                    color: context.colorScheme.onBackground.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ]),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (leading != null) ...<Widget>[
            leading!,
            SizedBox(width: leadingGap),
          ],
          content,
          if (trailing != null) ...<Widget>[
            SizedBox(width: trailingGap),
            trailing!,
          ],
        ],
      ),
    );
  }
}
