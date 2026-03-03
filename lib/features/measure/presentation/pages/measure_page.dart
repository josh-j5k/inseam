import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/avatar_initials_widget.dart';
import 'package:inseam/core/widgets/navbar_widget.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/recent_activity.dart';
import 'package:inseam/features/measure/data/templat_items.dart';
import 'package:inseam/features/measure/presentation/widgets/recent_activity_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/template_grid_item_widget.dart';

class MeasurePage extends StatefulWidget {
  const MeasurePage({super.key});

  @override
  State<MeasurePage> createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  late AppSpacing spacing;
  @override
  void didChangeDependencies() {
    spacing = AppSpacing(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measurement Hub'),
        leading: TextButton(
          onPressed: () {},
          child: Icon(Icons.search, color: AppColors.accent),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(indent: 20, endIndent: 20, thickness: 1),
                SpacerWidget(height: spacing.dividerSm()),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Start New Measurement", style: AppTextStyles.h2),
                      SpacerWidget(height: spacing.dividerSm() * 0.5),
                      Wrap(
                        children: [
                          Text(
                            "Select a client and a new template to begin a new session immediately",
                          ),
                        ],
                      ),
                      SpacerWidget(height: spacing.dividerSm() * 0.5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40),
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Text("Start Now".toUpperCase()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SpacerWidget(height: spacing.dividerMd()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Templates".toUpperCase(), style: AppTextStyles.h3),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All".toUpperCase(),
                        style: TextStyle(color: AppColors.accent),
                      ),
                    ),
                  ],
                ),
                SpacerWidget(height: spacing.dividerSm()),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 260,
                  children: [
                    ...templateGridItems.map(
                      (item) =>
                          TemplateGridItemWidget(spacing: spacing, item: item),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            SpacerWidget(height: spacing.dividerSm() * 0.5),
                            Text("Add New", style: AppTextStyles.h4),
                            Text(
                              "Create a new custom template",
                              style: AppTextStyles.subtext,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SpacerWidget(height: spacing.dividerMd()),
                Text(
                  "Recent Activities".toUpperCase(),
                  style: AppTextStyles.h3,
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Column(
                  spacing: 15,
                  children: recentActivities
                      .map(
                        (activity) => RecentActivityWidget(activity: activity),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
