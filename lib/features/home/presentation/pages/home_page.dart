import 'package:inseam/core/routes/app_routes.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/avatar_initials_widget.dart';
import "package:inseam/features/home/data/schedules.dart";
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/home/presentation/widgets/order_status_box_widget.dart';
import 'package:inseam/features/home/presentation/widgets/schedule_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppSpacing spacing;
  @override
  void didChangeDependencies() {
    spacing = AppSpacing(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
    super.didChangeDependencies();
  }

  String _selectedStatus = "all orders";
  final List<String> orderStatusFilter = [
    "all orders",
    "completed",
    "pending",
    "delivered",
    "urgent",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20,
              right: 20,
              bottom: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarInitialsWidget(
                          name: "inseam Manager",
                          ring: true,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Morning,", style: AppTextStyles.subtext),
                            Text(
                              "inseam".toUpperCase(),
                              style: AppTextStyles.h1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},

                      child: Icon(
                        Icons.notifications,
                        color: AppColors.accent,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SpacerWidget(height: spacing.dividerMd()),
                SearchBar(
                  hintText: "Search clients, measurements...",
                  hintStyle: WidgetStatePropertyAll(
                    TextStyle(color: AppColors.textSecondary),
                  ),
                  leading: Icon(Icons.search),
                  padding: WidgetStatePropertyAll(
                    EdgeInsetsGeometry.only(left: 15, right: 15),
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(width: 1.0, color: AppColors.border),
                  ),
                  backgroundColor: WidgetStatePropertyAll(AppColors.cardBg),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  shadowColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Divider(color: AppColors.border),
                SpacerWidget(height: spacing.dividerSm()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: spacing.paddingXAxisLg(),
                  children: [
                    Expanded(
                      child: OrderStatusBoxWidget(
                        status: "active",
                        statusCount: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Expanded(
                      child: OrderStatusBoxWidget(
                        status: "completed",
                        statusCount: 5,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: OrderStatusBoxWidget(
                        status: "urgent",
                        statusCount: 3,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SpacerWidget(height: spacing.dividerSm()),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: spacing.paddingXAxisLg(),
                    children: orderStatusFilter
                        .map(
                          (status) => ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedStatus = status;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedStatus == status
                                  ? AppColors.accent
                                  : AppColors.button,
                              foregroundColor: _selectedStatus == status
                                  ? Colors.white
                                  : AppColors.textSecondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(status.toUpperCase()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SpacerWidget(height: spacing.dividerMd()),
                Text(
                  "Today's Schedule".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                if (schedules.isNotEmpty)
                  Column(
                    spacing: spacing.paddingXAxisLg(),
                    children: schedules
                        .map(
                          (schedule) => ScheduleWidget(
                            spacing: spacing,
                            schedule: schedule,
                          ),
                        )
                        .toList(),
                  )
                else
                  SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addClient),
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
