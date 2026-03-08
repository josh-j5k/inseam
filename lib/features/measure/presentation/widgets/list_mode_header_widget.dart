import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/features/measure/presentation/widgets/switch_templates_widget.dart';

class ListModeHeaderWidget extends StatelessWidget {
  final AppSpacing spacing;
  const ListModeHeaderWidget({super.key, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.cardGradientBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text("Standard Female Gown", style: AppTextStyles.h4),
          subtitle: Text("18 Measurement Points", style: AppTextStyles.subtext),
          trailing: ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 0, horizontal: 6),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(7),
                ),
              ),
              shadowColor: WidgetStatePropertyAll(Colors.transparent),
              backgroundColor: WidgetStatePropertyAll(AppColors.button),
            ),
            onPressed: () => showModalBottomSheet(
              isDismissible: true,
              enableDrag: true,
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => DraggableScrollableSheet(
                initialChildSize: 0.9, // starts at 50%
                minChildSize: 0.1,
                // maxChildSize: 0.9,
                expand: false,
                builder: (context, scrollController) => SwitchTemplatesWidget(
                  spacing: spacing,
                  scrollController: scrollController,
                ),
              ),
            ),
            child: FittedBox(
              child: Text("Templates", style: TextStyle(fontSize: 12)),
            ),
          ),
        ),
      ),
    );
  }
}
