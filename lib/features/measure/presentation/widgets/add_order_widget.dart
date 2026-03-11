import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/features/measure/presentation/widgets/client_lists_widget.dart';
import 'package:inseam/features/measure/presentation/widgets/switch_templates_widget.dart';

class AddOrderWidget extends StatefulWidget {
  final AppSpacing spacing;
  const AddOrderWidget({super.key, required this.spacing});
  @override
  State<AddOrderWidget> createState() => _AddOrderWidgetState();
}

class _AddOrderWidgetState extends State<AddOrderWidget> {
  int _stage = 0;

  void changeStage(int stage) {
    if (_stage == stage) {
      return;
    }
    setState(() {
      _stage = stage;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMovingForward = _stage > 0 ? true : false;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      // This is the magic part
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Offset(x, y): 1.0 is far right, -1.0 is far left
        final slideInOffset = isMovingForward
            ? const Offset(1.0, 0.0) // Slide in from right
            : const Offset(-1.0, 0.0); // Slide in from left

        return SlideTransition(
          position: Tween<Offset>(begin: slideInOffset, end: Offset.zero)
              .animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                ),
              ),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        key: ValueKey<int>(_stage), // MUST HAVE A KEY
        child: isMovingForward
            ? SwitchTemplatesWidget(
                spacing: widget.spacing,
                changeStage: changeStage,
                showBackButton: true,
              )
            : ClientListsWidget(
                spacing: widget.spacing,
                changeStage: changeStage,
              ),
      ),
    );
  }
}

// padding: const EdgeInsets.all(20),
//       height: double.infinity,
