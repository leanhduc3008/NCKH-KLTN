import 'package:flutter/material.dart';

import '../../common/constants/theme.dart';

class TableCellSettings extends StatelessWidget {
  const TableCellSettings({super.key, required this.title, this.onTap});

  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: AppColors.text)),
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios,
                  color: AppColors.text, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
