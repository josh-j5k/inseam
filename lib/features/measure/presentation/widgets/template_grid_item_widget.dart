import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/network_image_widget.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/models/template_grid_items.dart';

class TemplateGridItemWidget extends StatelessWidget {
  final AppSpacing spacing;
  final TemplateGridItems item;
  const TemplateGridItemWidget({
    super.key,
    required this.spacing,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradientBg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                NetworkImageWidget(imgSrc: item.imgSrc),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item.points,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SpacerWidget(height: spacing.dividerSm() * 0.5),
          Text(item.title, style: AppTextStyles.h4),
          SpacerWidget(height: spacing.dividerSm() * 0.3),
          Wrap(
            children: [Text(item.description, style: AppTextStyles.subtext)],
          ),
        ],
      ),
    );
  }
}
