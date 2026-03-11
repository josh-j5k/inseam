import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/utils/get_filename.dart';
import 'package:inseam/core/utils/native_picker.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/measurement_points_widget.dart';

class AddTemplatePage extends StatefulWidget {
  const AddTemplatePage({super.key});

  @override
  State<AddTemplatePage> createState() => _AddTemplateState();
}

class _AddTemplateState extends State<AddTemplatePage> {
  late AppSpacing spacing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    spacing = AppSpacing(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  final List<int> selectedItems = [];
  File? _thumbnail = null;
  String? thumbnailName = null;
  void setSelectedItems(List<int> items) {
    selectedItems.clear();
    selectedItems.addAll(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Template"),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: AppColors.accent,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: Text("Save"),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: AppColors.cardGradientBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("TEMPLATE NAME", style: AppTextStyles.h4),
                    SpacerWidget(height: spacing.dividerSm()),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "e.g Men's Suit Standard",
                      ),
                    ),
                    SpacerWidget(height: spacing.dividerSm()),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            hint: Wrap(
                              spacing: 10,
                              children: [
                                const Icon(FontAwesomeIcons.boxesStacked),
                                const Text("Category"),
                              ],
                            ),
                            items:
                                ["Adult Male", "Adult Female", "Child(Unisex)"]
                                    .map(
                                      (gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: AppColors.accent.withAlpha(50),
                            onTap: () async {
                              final File? file = await imagePicker();
                              if (file != null) {
                                final String name = getFilename(file.path);
                                final substr = name.length > 17
                                    ? "${name.substring(0, 16)}..."
                                    : name;

                                setState(() {
                                  _thumbnail = file;
                                  thumbnailName = substr;
                                });
                              }
                            },
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: const Color.fromARGB(255, 205, 56, 56),
                                ),
                                Text(thumbnailName ?? "Select thumbnail"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SpacerWidget(height: spacing.dividerMd()),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Select Measurements Points",
                          style: AppTextStyles.h4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: AppColors.cardGradientBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Wrap(
                            spacing: 4,
                            children: [
                              Text(
                                selectedItems.length.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Selected",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SpacerWidget(height: spacing.dividerSm()),

                    MeasurementPointsWidget(
                      spacing: spacing,
                      setSelectedItems: (selectedItems) =>
                          setSelectedItems(selectedItems),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
