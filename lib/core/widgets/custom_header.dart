import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_text_styles.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final bool automaticallyImpliedLeading;
  final Widget? leading;
  final Widget? thrailing;
  const CustomHeader({
    super.key,
    required this.title,
    this.automaticallyImpliedLeading = false,
    this.leading,
    this.thrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: automaticallyImpliedLeading ? leading! : SizedBox(),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.h1.copyWith(color: AppColors.accent),
            ),
          ),
        ),
        Expanded(flex: 1, child: thrailing ?? SizedBox()),
      ],
    );
  }
}
