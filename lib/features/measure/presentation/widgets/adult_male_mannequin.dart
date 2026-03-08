import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inseam/core/data/models/measurement_units.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/features/measure/data/measurement_points.dart';

import 'package:inseam/features/measure/data/models/measurement_points.dart';
import 'package:inseam/features/measure/presentation/widgets/mannequin_side.dart';
import 'package:inseam/features/measure/presentation/widgets/visual_mode_header_widget.dart';

class AdultMaleMannequin extends StatefulWidget {
  final String unit;
  final AppSpacing spacing;
  final List<Map<String, dynamic>> inputData;
  const AdultMaleMannequin({
    super.key,
    required this.unit,
    required this.spacing,
    required this.inputData,
  });
  @override
  State<AdultMaleMannequin> createState() => _AdultMaleMannequinState();
}

class _AdultMaleMannequinState extends State<AdultMaleMannequin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;
  List<MeasurementPoints>? points;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    final filteredPoints = Map<String, List<MeasurementPoints>>.fromEntries(
      measurementPoints.entries.map((entry) {
        final filteredList = entry.value
            .where((item) => item.category == Category.all)
            .toList();
        return MapEntry(entry.key, filteredList);
      }),
      // .where((entry) => entry.key != "upperBody"),
    );
    points = [
      ...filteredPoints["torso"]!,
      ...filteredPoints["lowerBody"]!,
      ...filteredPoints["upperBody"]!,
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _isFront = !_isFront);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flip button
        VisualModeHeaderWidget(flip: _flip, spacing: widget.spacing),
        Expanded(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // first half: front rotates away, second half: back appears
              final angle = _animation.value * pi;
              final isFrontFacing = angle < pi / 2;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateY(angle),
                child: isFrontFacing
                    ? MannequinSide(
                        inputData: widget.inputData,
                        selectedUnit: widget.unit,
                        image: 'assets/images/adult_male_mannequin_front.jpg',
                        points: points!
                            .where((item) => item.side == BodySide.front)
                            .toList(),
                        category: Category.man,
                      )
                    : Transform(
                        // mirror the back so it isn't flipped
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(pi),
                        child: MannequinSide(
                          inputData: widget.inputData,
                          selectedUnit: widget.unit,
                          image: 'assets/images/adult_male_mannequin_back.jpg',
                          points: points!
                              .where((item) => item.side == BodySide.back)
                              .toList(),
                          category: Category.man,
                        ),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
