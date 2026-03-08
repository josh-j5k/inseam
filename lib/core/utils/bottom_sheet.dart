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
