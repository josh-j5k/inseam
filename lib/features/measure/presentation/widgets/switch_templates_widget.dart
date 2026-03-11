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
  final void Function(int stage)? changeStage;
  final bool showBackButton;
  const SwitchTemplatesWidget({
    super.key,
    required this.spacing,
    this.changeStage,
    this.scrollController,
    this.showBackButton = false,
  });

  @override
  State<SwitchTemplatesWidget> createState() => _SwitchTemplateWidgetState();
}

class _SwitchTemplateWidgetState extends State<SwitchTemplatesWidget> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              children: [
                if (widget.showBackButton)
                  BackButton(onPressed: () => widget.changeStage!(0)),
                const Text("Select Template", style: AppTextStyles.h3),
              ],
            ),
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
            children: [
              for (final (index, item) in templateGridItems.indexed)
                InkWell(
                  onTap: () {
                    if (_selectedIndex == index) {
                      setState(() {
                        _selectedIndex = null;
                      });
                      return;
                    }
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: _selectedIndex == index
                              ? BoxBorder.all(width: 1, color: AppColors.accent)
                              : BoxBorder.fromBorderSide(BorderSide.none),
                        ),
                        child: TemplateGridItemWidget(
                          spacing: widget.spacing,
                          item: item,
                        ),
                      ),
                      if (index == _selectedIndex)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.accent,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    _selectedIndex != null
                        ? AppColors.accent
                        : AppColors.accent.withAlpha(100),
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
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
    );
  }
}
