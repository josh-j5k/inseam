import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/features/measure/presentation/widgets/switch_templates_widget.dart';

class VisualModeHeaderWidget extends StatelessWidget {
  final void Function() flip;
  final AppSpacing spacing;
  const VisualModeHeaderWidget({
    super.key,
    required this.flip,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.cardGradientBg),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: AppColors.accent),
            onPressed: flip,
            icon: Icon(Icons.rotate_right),
            label: Text("Flip", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          TextButton.icon(
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              // backgroundColor: AppColors.button,
            ),
            onPressed: () => showModalBottomSheet(
              isDismissible: true,
              enableDrag: true,
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => DraggableScrollableSheet(
                initialChildSize: 0.9, // starts at 50%
                minChildSize: 0.1,
                // maxChildSize: 0.9,
                expand: false,
                builder: (context, scrollController) => SwitchTemplatesWidget(
                  spacing: spacing,
                  scrollController: scrollController,
                ),
              ),
            ),
            label: Text(
              "Standard Wedding Gown",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            icon: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}
