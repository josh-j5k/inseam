import 'package:flutter/material.dart';
import 'package:inseam/core/constants/app_constants.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_text_styles.dart';

class UnitsBottomSheetWidget extends StatefulWidget {
  final String units;
  final dynamic sheetContext;
  final void Function(String unit) updateUnits;
  const UnitsBottomSheetWidget({
    super.key,
    required this.units,
    required this.updateUnits,
    required this.sheetContext,
  });

  @override
  State<UnitsBottomSheetWidget> createState() => _UnitsBottomSheetWidgetState();
}

class _UnitsBottomSheetWidgetState extends State<UnitsBottomSheetWidget> {
  String? _unit;
  void updateUnits(String unit) {
    if (unit == _unit) {
      return;
    }
    setState(() {
      _unit = unit;
    });
    widget.updateUnits(unit);
  }

  @override
  void initState() {
    super.initState();
    _unit = widget.units;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // width: double.infinity,
      height: 100,
      decoration: BoxDecoration(gradient: AppColors.cardGradientBg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 5,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Units", style: AppTextStyles.h3),
                const Text(
                  "Measuring Preferences",
                  style: AppTextStyles.subtext,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [Colors.white, Colors.white70]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: widget.units == AppUnits.centimeters
                        ? AppColors.accent
                        : Colors.transparent,
                    foregroundColor: widget.units == AppUnits.centimeters
                        ? Colors.white
                        : AppColors.textSecondary,
                  ),
                  onPressed: () => updateUnits(AppUnits.centimeters),
                  child: Text(AppUnits.centimeters.toUpperCase()),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: widget.units == AppUnits.inches
                        ? AppColors.accent
                        : Colors.transparent,
                    foregroundColor: widget.units == AppUnits.inches
                        ? Colors.white
                        : AppColors.textSecondary,
                  ),
                  onPressed: () => updateUnits(AppUnits.inches),
                  child: Text(AppUnits.inches.toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
