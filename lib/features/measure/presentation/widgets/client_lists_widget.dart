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
  const ClientListsWidget({
    super.key,
    required this.spacing,
    this.scrollController,
  });

  @override
  State<ClientListsWidget> createState() => _ClientListsWidgetState();
}

class _ClientListsWidgetState extends State<ClientListsWidget> {
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
              children: clientList.map((client) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.cardGradientBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: AvatarInitialsWidget(name: client.name),
                        title: Text(client.name),
                        subtitle: Text(client.address),
                      ),
                    ),
                    SpacerWidget(height: widget.spacing.dividerSm()),
                  ],
                );
              }).toList(),
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
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
