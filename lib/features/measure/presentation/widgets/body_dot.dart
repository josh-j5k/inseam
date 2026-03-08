import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';

class BodyDot extends StatefulWidget {
  final bool isActive;
  final bool isFilled;

  const BodyDot({super.key, this.isActive = false, this.isFilled = false});
  // Animation controller for infinite loop
  @override
  State<BodyDot> createState() => _BodyDotState();
}

class _BodyDotState extends State<BodyDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  final double startingPoint = 0;
  final double maxPoint = 1;
  // final double midPoint = 0.1;
  final double interval = 1;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000), // Total animation duration
      vsync: this,
    )..repeat(); // Infinite loop

    _widthAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: startingPoint,
          end: maxPoint,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: interval,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) => AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.isActive
              ? AppColors.accent
              : widget.isFilled
              ? Colors.cyanAccent
              : Colors.white.withValues(alpha: 0.7),
          border: Border.all(
            color: widget.isActive ? Colors.white : AppColors.accent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.isActive
                  ? AppColors.accent.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.3),
              blurRadius: widget.isActive ? 12 : 4,
              spreadRadius: widget.isActive ? 25 * _widthAnimation.value : 1,
            ),
          ],
        ),
      ),
    );
  }
}
