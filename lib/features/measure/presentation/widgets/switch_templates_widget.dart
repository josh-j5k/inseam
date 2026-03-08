import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/templat_items.dart';
import 'package:inseam/features/measure/presentation/widgets/template_grid_item_widget.dart';

class SwitchTemplatesWidget extends StatefulWidget {
  final AppSpacing spacing;
  final ScrollController? scrollController;
  const SwitchTemplatesWidget({
    super.key,
    required this.spacing,
    this.scrollController,
  });

  @override
  State<SwitchTemplatesWidget> createState() => _SwitchTemplateWidgetState();
}

class _SwitchTemplateWidgetState extends State<SwitchTemplatesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Select Template", style: AppTextStyles.h3),
              CloseButton(),
            ],
          ),
          SearchBar(
            onChanged: (String value) {
              // _onSearchChanged(value);
            },
            hintText: "Search points e.g Neck, Waist...",
            leading: Icon(Icons.search),
          ),
          SpacerWidget(height: widget.spacing.dividerSm()),
          const Divider(),
          SpacerWidget(height: widget.spacing.dividerSm()),
          Expanded(
            child: GridView.count(
              controller: widget.scrollController ?? ScrollController(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 260,
              children: templateGridItems
                  .map(
                    (item) => TemplateGridItemWidget(
                      spacing: widget.spacing,
                      item: item,
                    ),
                  )
                  .toList(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.accent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Apply Template"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
