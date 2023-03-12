import 'package:flutter/material.dart';

import '../../../common/constants/images.dart';
import '../../../common/constants/theme.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.blueText),
                shape: BoxShape.circle),
            child: Stack(children: [
              Positioned(
                  child: CircleAvatar(
                radius: 80,
                foregroundImage: Image.asset(
                  AppImages.imagesProfile,
                  fit: BoxFit.cover,
                ).image,
                foregroundColor: AppColors.transparentColor,
              )),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: 34,
                    height: 34,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.blueText,
                      ),
                      onTap: () {
                        // controller.pickImage();
                      },
                    )),
              ),
            ])));
  }
}
