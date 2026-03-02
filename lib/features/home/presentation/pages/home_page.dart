import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/home/presentation/widgets/order_status_box_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                        CircleAvatar(radius: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("good morning"),
                            Text("inseam".toUpperCase()),
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
                    TextStyle(
                      color: Color.from(alpha: 0.7, red: 0, green: 0, blue: 0),
                    ),
                  ),
                  leading: Icon(Icons.search),
                  padding: WidgetStatePropertyAll(
                    EdgeInsetsGeometry.only(left: 15, right: 15),
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(width: 1.0, color: Colors.grey[300]!),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.grey[100]),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  shadowColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Divider(color: Colors.grey[300]),
                SpacerWidget(height: spacing.dividerSm()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: spacing.paddingXAxisLg(),
                  children: [
                    Expanded(
                      child: OrderStatusBoxWidget(
                        status: "active",
                        statusCount: 12,
                        color: Colors.black54,
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
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacerWidget(height: spacing.dividerMd()),
                Text(
                  "Today's Schedule".toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Container(
                  // height: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.paddingXAxisLg(),
                    vertical: spacing.paddingYAxisMd(),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                    border: Border(
                      left: BorderSide(width: 6, color: Colors.blue),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: spacing.paddingXAxisLg(),
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[300],
                            child: Text(
                              "MH",
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mat Harden",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Wedding Dress Alterations",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              Row(
                                spacing: 4,
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  Text(
                                    "Deadline: Today, 2:00PM",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        spacing: 2,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            // iconSize: 10,
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.green.withAlpha(50),
                              ),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                            ),
                          ),
                          IconButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.blue.withAlpha(50),
                              ),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.blue.shade400,
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
