import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/string_utils.dart';
import '../../common/constants/dimens.dart';
import '../../common/extension/extenstion.dart';
import 'error_image.dart';

class RoundedRectImage extends StatelessWidget {
  const RoundedRectImage({
    super.key,
    this.imageURL,
    this.width = Dimens.s12,
    this.height = Dimens.s10,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String? imageURL;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (imageURL == null || !StringUtils.isURL(imageURL!)) {
      return ErrorImage(
        width: width,
        height: height,
        borderRadius: borderRadius,
      );
    }

    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3),
        child: Container(
          color: context.colorScheme.background,
          child: CachedNetworkImage(
            imageUrl: imageURL!,
            width: width,
            height: height,
            fit: fit,
            progressIndicatorBuilder: (_, __, DownloadProgress progress) =>
                Center(
                    child: CircularProgressIndicator(value: progress.progress)),
            errorWidget: (_, __, ___) => ErrorImage(
              width: width,
              height: height,
              borderRadius: borderRadius,
            ),
          ),
        ));
  }

  static Widget square({
    String? imageURL,
    double size = Dimens.s10,
    BorderRadiusGeometry? borderRadius,
  }) =>
      RoundedRectImage(
        imageURL: imageURL,
        width: size,
        height: size,
        borderRadius: borderRadius,
      );

  static Widget file({
    String? imagePath,
    double? width,
    double? height,
    BorderRadiusGeometry? borderRadius,
  }) {
    if (imagePath == null || imagePath.isEmpty) {
      return ErrorImage(
        width: width,
        height: height,
        borderRadius: borderRadius,
      );
    }

    return Builder(builder: (context) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(Dimens.s3),
        child: ColoredBox(
          color: context.colorScheme.background,
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        ),
      );
    });
  }
}
