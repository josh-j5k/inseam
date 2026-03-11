import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/avatar_initials_widget.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/client_lists.dart';

class ClientListsWidget extends StatefulWidget {
  final AppSpacing spacing;
  final ScrollController? scrollController;
  final void Function(int stage)? changeStage;
  const ClientListsWidget({
    super.key,
    required this.spacing,
    this.scrollController,
    this.changeStage,
  });

  @override
  State<ClientListsWidget> createState() => _ClientListsWidgetState();
}

class _ClientListsWidgetState extends State<ClientListsWidget> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Select Client", style: AppTextStyles.h3),
            CloseButton(),
          ],
        ),
        SearchBar(
          onChanged: (String value) {
            // _onSearchChanged(value);
          },
          hintText: "Search client name, address...",
          leading: Icon(Icons.search),
        ),
        SpacerWidget(height: widget.spacing.dividerSm()),
        const Divider(),
        SpacerWidget(height: widget.spacing.dividerSm()),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final (index, client) in clientList.indexed)
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: _selectedIndex == index
                                ? AppColors.cardGradientBg2
                                : AppColors.cardGradientBg,
                            borderRadius: BorderRadius.circular(10),
                            border: _selectedIndex == index
                                ? BoxBorder.all(
                                    width: 1,
                                    color: AppColors.accent,
                                  )
                                : BoxBorder.fromBorderSide(BorderSide.none),
                          ),
                          child: ListTile(
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
                            leading: AvatarInitialsWidget(name: client.name),
                            title: Text(client.name),
                            subtitle: Text(client.address),
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
                    SpacerWidget(height: widget.spacing.dividerSm()),
                  ],
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
                onPressed: _selectedIndex != null
                    ? () => widget.changeStage!(1)
                    : null,
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
