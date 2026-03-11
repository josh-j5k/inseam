import 'package:flutter/material.dart';

void showBottomSheetModal({
  required BuildContext context,
  required Widget widget,
  double start = 0.9,
  double min = 0.1,
}) {
  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: start, // starts at 50%
      minChildSize: min,
      // maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => widget,
    ),
  );
}

void showAnimatedBottomSheetModal({
  required BuildContext context,
  required Widget widget,
  required int key,
  double start = 0.9,
  double min = 0.1,
}) {
  showModalBottomSheet(
    isDismissible: true,
    enableDrag: true,
    showDragHandle: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: start, // starts at 50%
      minChildSize: min,
      // maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final slideInOffset = key == 0
              ? const Offset(1.0, 0.0) // Slide in from right
              : const Offset(-1.0, 0.0);
          return SlideTransition(
            position: Tween<Offset>(begin: slideInOffset, end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOutCubic,
                  ),
                ),
            child: child,
          );
        },
        child: widget,
      ),
    ),
  );
}
