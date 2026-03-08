import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  late AppSpacing spacing;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    spacing = AppSpacing(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  bool quickMeasurement = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Client"), centerTitle: true),
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
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.border,
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.accent,
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SpacerWidget(height: 5),
                Center(
                  child: Text(
                    "Upload Photo",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SpacerWidget(height: spacing.dividerLg()),
                Text(
                  "Personal Information".toUpperCase(),
                  style: AppTextStyles.h3,
                ),
                SpacerWidget(height: spacing.dividerSm()),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Row(
                  spacing: spacing.paddingXAxisLg(),
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.inputBg,
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        ),
                      ),
                      icon: Icon(color: AppColors.accent, Icons.contacts),
                    ),
                  ],
                ),
                SpacerWidget(height: spacing.dividerSm()),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SpacerWidget(height: spacing.dividerSm()),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Address",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                SpacerWidget(height: spacing.dividerLg()),
                Text(
                  "Measurement Settings".toUpperCase(),
                  style: AppTextStyles.h3,
                ),
                SpacerWidget(height: spacing.dividerSm()),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.cardGradientBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.border, width: 1),
                  ),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.border,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FontAwesomeIcons.rulerHorizontal,
                              color: AppColors.accent,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quick Measurement",
                                style: AppTextStyles.h4,
                              ),
                              Text(
                                "Launch measurement after save",
                                style: AppTextStyles.subtext,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: quickMeasurement,
                        onChanged: (val) {
                          setState(() {
                            quickMeasurement = val;
                          });
                        },
                        activeThumbColor: AppColors.accent,
                      ),
                    ],
                  ),
                ),
                SpacerWidget(height: spacing.dividerLg()),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Save Client"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
