import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/avatar_initials_widget.dart';
import 'package:inseam/features/measure/data/models/recent_activity.dart';

class RecentActivityWidget extends StatelessWidget {
  final RecentActivity activity;
  const RecentActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              AvatarInitialsWidget(name: activity.name),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity.name, style: AppTextStyles.h4),
                  Text(
                    "${activity.description} - ${activity.date}",
                    style: AppTextStyles.subtext,
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
    );
  }
}
