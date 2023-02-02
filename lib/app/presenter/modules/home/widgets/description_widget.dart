import 'package:flutter/material.dart';

import '../../../../core/ui/app_text_styles.dart';

class DescriptionWidget extends StatelessWidget {
  final String title;
  final String data;

  const DescriptionWidget({
    required this.title,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.textBold18,
          ),
          Text(
            data,
            style: AppTextStyles.textRegular16,
          ),
        ],
      ),
    );
  }
}
