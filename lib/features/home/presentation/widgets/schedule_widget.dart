import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/avatar_initials_widget.dart';
import 'package:inseam/features/home/data/models/schedule.dart';
import 'package:inseam/utils/color_from_hash_code.dart';
import 'package:inseam/utils/get_initials.dart';

class ScheduleWidget extends StatelessWidget {
  final AppSpacing spacing;
  final Schedule schedule;
  const ScheduleWidget({
    super.key,
    required this.spacing,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: spacing.paddingXAxisLg(),
        vertical: spacing.paddingYAxisSm(),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        border: Border(
          left: BorderSide(
            width: 6,
            color: schedule.status == "urgent"
                ? Colors.red
                : schedule.status == "completed"
                ? Colors.blue
                : Colors.green,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: spacing.paddingXAxisLg(),
              children: [
                AvatarInitialsWidget(name: schedule.name),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(schedule.name, style: AppTextStyles.h2),
                      Text(schedule.task, style: AppTextStyles.subtext),
                      Row(
                        spacing: spacing.paddingXAxisSm(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            schedule.status == "urgent"
                                ? Icons.access_time_filled
                                : Icons.calendar_today,
                            color: schedule.status == "urgent"
                                ? Colors.red
                                : schedule.status == "completed"
                                ? Colors.blue
                                : Colors.green,
                            size: 18,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    Text(
                                      schedule.note,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: schedule.status == "urgent"
                                            ? Colors.red
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
            child: Stack(
              children: [
                IconButton(
                  iconSize: 20,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green.withAlpha(50),
                    ),
                    minimumSize: WidgetStatePropertyAll(Size(25, 25)),
                    maximumSize: WidgetStatePropertyAll(Size(35, 35)),
                  ),

                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    iconSize: 20,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.blue.withAlpha(50),
                      ),
                      minimumSize: WidgetStatePropertyAll(Size(25, 25)),
                      maximumSize: WidgetStatePropertyAll(Size(35, 35)),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.phone, color: Colors.blue.shade400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
