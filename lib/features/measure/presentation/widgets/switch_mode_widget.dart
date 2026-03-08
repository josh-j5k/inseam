import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';

class SwitchModeWidget extends StatelessWidget {
  final String mode;
  final void Function(String mode) updateMode;
  const SwitchModeWidget({
    super.key,
    required this.mode,
    required this.updateMode,
  });

  // @override
  // State<SwitchModeWidget> createState() => _SwitchModeWidgetState();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.cardGradientBg,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          spacing: 4,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => updateMode("visual"),
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  foregroundColor: WidgetStatePropertyAll(
                    mode == "visual" ? Colors.white : AppColors.textSecondary,
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    mode == "visual" ? AppColors.accent : Colors.transparent,
                  ),

                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(Icons.threed_rotation_rounded),
                    Text("Visual Mode"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => updateMode("list"),

                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0),
                  foregroundColor: WidgetStatePropertyAll(
                    mode == "list" ? Colors.white : AppColors.textSecondary,
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    mode == "list" ? AppColors.accent : Colors.transparent,
                  ),

                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.list), Text("List Mode")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _SwitchModeWidgetState extends State<SwitchModeWidget> {

// }
