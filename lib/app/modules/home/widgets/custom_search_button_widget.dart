import 'package:flutter/material.dart';

import '../../../core/ui/app_colors.dart';

class CustomSearchButtonWidget extends StatelessWidget {
  const CustomSearchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.borderSearch.withOpacity(0.9),
            blurRadius: 3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: ((value) {}),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 12, 0),
          fillColor: AppColors.white,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: AppColors.borderSearch,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: AppColors.borderSearch,
            ),
          ),
          suffixIcon: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.7),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
