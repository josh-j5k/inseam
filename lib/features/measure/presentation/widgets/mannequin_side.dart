import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/features/measure/data/models/measurement_points.dart';
import 'package:inseam/features/measure/presentation/widgets/body_dot.dart';

class MannequinSide extends StatefulWidget {
  final String image;
  final Category category;
  final List<MeasurementPoints> points;
  final String selectedUnit;
  final List<Map<String, dynamic>> inputData;
  const MannequinSide({
    super.key,
    required this.inputData,
    required this.selectedUnit,
    required this.image,
    required this.points,
    required this.category,
  });
  @override
  State<MannequinSide> createState() => _MannequinSideState();
}

class _MannequinSideState extends State<MannequinSide> {
  MeasurementPoints? _selectedPoint;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 4.0, // how far they can zoom in
      boundaryMargin: EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Image.asset(widget.image, fit: BoxFit.cover, height: 700),
              ...widget.points.map(
                (point) => Positioned(
                  left:
                      (widget.category == Category.man
                          ? point.xManPercent
                          : widget.category == Category.woman
                          ? point.xWomanPercent
                          : point.xChildPercent)! *
                      constraints.maxWidth,
                  top:
                      (widget.category == Category.man
                          ? point.yManPercent
                          : widget.category == Category.woman
                          ? point.yWomanPercent
                          : point.yChildPercent)! *
                      constraints.maxHeight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(20, 20),
                      maximumSize: Size(25, 25),
                      padding: const EdgeInsets.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      if (_selectedPoint?.name == point.name) {
                        setState(() {
                          _selectedPoint = null;
                        });
                        return;
                      }
                      setState(() {
                        _selectedPoint = point;
                      });
                    },
                    child: BodyDot(
                      isActive: _selectedPoint?.name == point.name,
                      isFilled:
                          widget.inputData.isNotEmpty &&
                          widget.inputData.any(
                            (item) => item['id'] == point.id,
                          ),
                    ),
                  ),
                ),
              ),
              if (_selectedPoint != null)
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: AppColors.cardGradientBg.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              _selectedPoint!.name,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 6,
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.end,
                                  controller: TextEditingController(
                                    text:
                                        widget.inputData.any(
                                          (item) =>
                                              item['id'] == _selectedPoint!.id,
                                        )
                                        ? widget.inputData
                                              .where(
                                                (item) =>
                                                    item['id'] ==
                                                    _selectedPoint!.id,
                                              )
                                              .toList()
                                              .elementAt(0)['value']
                                        : "",
                                  ),
                                  onSubmitted: (value) {
                                    setState(() {
                                      widget.inputData.add({
                                        "value": value,
                                        "id": _selectedPoint!.id,
                                      });
                                    });
                                  },
                                  style: AppTextStyles.h3,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    hintText: "--",
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 5,
                                    ),
                                    fillColor: Colors.transparent,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.accent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                widget.selectedUnit.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: AppColors.accent),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
