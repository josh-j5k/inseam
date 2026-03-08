import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imgSrc;
  const NetworkImageWidget({super.key, required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgSrc,
      errorBuilder: (context, error, stackTrace) => Text("Couldn't load image"),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          decoration: BoxDecoration(gradient: AppColors.cardGradientBg),
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.accent.withAlpha(100),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
