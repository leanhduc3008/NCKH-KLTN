import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/string_utils.dart';
import '../../common/constants/dimens.dart';
import 'error_image.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.size = Dimens.s10,
    this.imageURL,
    this.border,
  });

  final double size;
  final String? imageURL;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    if (imageURL == null || !StringUtils.isURL(imageURL!)) {
      return ErrorImage(width: size, height: size, isRounded: true);
    }

    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: imageURL!,
      fit: BoxFit.cover,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) {
        return Container(
          decoration: BoxDecoration(
            border: border,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(backgroundImage: imageProvider),
        );
      },
      progressIndicatorBuilder: (_, __, DownloadProgress progress) =>
          Center(child: CircularProgressIndicator(value: progress.progress)),
      errorWidget: (_, __, ___) =>
          ErrorImage(width: size, height: size, isRounded: true),
    );
  }
}
