import 'package:flutter/material.dart';

import '../../common/constants/dimens.dart';
import '../../common/extension/context_extension.dart';
import '../image/rounded_rect_image.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.content,
    this.leading,
    this.leadingGap = Dimens.s3,
    this.trailing,
    this.trailingGap = Dimens.s3,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(Dimens.s3),
    this.margin,
    this.borderRadius,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.decoration,
  });

  factory BaseCard.image({
    Key? key,
    required String? imageUrl,
    required Widget content,
    padding = const EdgeInsets.all(Dimens.s2),
    Widget? leading,
    double leadingGap = Dimens.s3,
    Widget? trailing,
    double trailingGap = Dimens.s3,
    double height = 150,
    double? width,
  }) {
    return BaseCard(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.zero,
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
            Expanded(child: content),
            if (trailing != null) ...<Widget>[
              SizedBox(width: trailingGap),
              trailing,
            ],
          ],
        ),
      ),
      leadingGap: 0,
      leading: RoundedRectImage.square(
        borderRadius:
            const BorderRadius.horizontal(left: Radius.circular(Dimens.s3)),
        imageURL: imageUrl,
        size: height,
      ),
      height: height,
      width: width,
    );
  }

  final Widget? leading;
  final double leadingGap;
  final Widget content;
  final double trailingGap;
  final Widget? trailing;
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
              color: context.colorScheme.secondaryContainer,
              borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onBackground.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (leading != null) ...<Widget>[
            leading!,
            SizedBox(width: leadingGap),
          ],
          Expanded(child: content),
          if (trailing != null) ...<Widget>[
            SizedBox(width: trailingGap),
            trailing!,
          ],
        ],
      ),
    );
  }
}
