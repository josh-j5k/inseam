import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inseam/core/constants/app_constants.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/custom_header.dart';
import 'package:inseam/core/widgets/network_image_widget.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/core/widgets/units_bottom_sheet_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/adult_male_mannequin.dart';
import 'package:inseam/features/measure/presentation/widgets/insert_measurement_points_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/list_mode_header_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/switch_mode_widget.dart';

class NewMeasurementPage extends StatefulWidget {
  const NewMeasurementPage({super.key});

  @override
  State<NewMeasurementPage> createState() => _NewMeasurementPageState();
}

class _NewMeasurementPageState extends State<NewMeasurementPage> {
  String _unit = AppUnits.centimeters;
  String _mode = "visual";
  final List<Map<String, dynamic>> _inputData = [];
  AppSpacing? spacing;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    spacing = AppSpacing(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }

  void updateUnits(String unit) {
    if (unit == _unit) {
      return;
    }
    setState(() {
      _unit = unit;
    });
  }

  void updateMode(String mode) {
    if (mode == _mode) {
      return;
    }
    setState(() {
      _mode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CustomHeader(
              title: "New Measurement",
              automaticallyImpliedLeading: true,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_outlined),
              ),
              thrailing: IconButton(
                onPressed: () => showModalBottomSheet(
                  enableDrag: true,
                  showDragHandle: true,
                  isDismissible: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      initialChildSize: 0.2, // starts at 50%
                      minChildSize: 0.1,
                      expand: false,
                      builder: (context, scrollController) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          // width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: AppColors.cardGradientBg,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 5,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Units",
                                      style: AppTextStyles.h3,
                                    ),
                                    const Text(
                                      "Measuring Preferences",
                                      style: AppTextStyles.subtext,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    colors: [Colors.white, Colors.white70],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        backgroundColor:
                                            _unit == AppUnits.centimeters
                                            ? AppColors.accent
                                            : Colors.transparent,
                                        foregroundColor:
                                            _unit == AppUnits.centimeters
                                            ? Colors.white
                                            : AppColors.textSecondary,
                                      ),
                                      onPressed: () =>
                                          updateUnits(AppUnits.centimeters),
                                      child: Text(
                                        AppUnits.centimeters.toUpperCase(),
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        backgroundColor:
                                            _unit == AppUnits.inches
                                            ? AppColors.accent
                                            : Colors.transparent,
                                        foregroundColor:
                                            _unit == AppUnits.inches
                                            ? Colors.white
                                            : AppColors.textSecondary,
                                      ),
                                      onPressed: () =>
                                          updateUnits(AppUnits.inches),
                                      child: Text(
                                        AppUnits.inches.toUpperCase(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                icon: Icon(Icons.more_vert),
              ),
            ),
            const Divider(indent: 20, endIndent: 20, thickness: 1),
            Column(
              children: [
                SwitchModeWidget(mode: _mode, updateMode: updateMode),
                if (_mode == "list") ListModeHeaderWidget(spacing: spacing!),
                _mode == "list"
                    ? InsertMeasurementPointsWidget(
                        inputData: _inputData,
                        spacing: spacing!,
                        unit: _unit,
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 700,

                        child: AdultMaleMannequin(
                          inputData: _inputData,
                          unit: _unit,
                          spacing: spacing!,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.check),
      ),
    );
  }
}
