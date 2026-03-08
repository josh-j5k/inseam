import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
// import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/measurement_points.dart';
import 'package:inseam/features/measure/data/models/measurement_points.dart';
// import 'package:inseam/core/utils/debouncer.dart';

class InsertMeasurementPointsWidget extends StatefulWidget {
  final List<Map<String, dynamic>> inputData;
  final AppSpacing spacing;
  final String unit;
  const InsertMeasurementPointsWidget({
    super.key,
    required this.spacing,
    required this.inputData,
    required this.unit,
  });

  @override
  State<InsertMeasurementPointsWidget> createState() =>
      _MeasurementPointsWidgetState();
}

class _MeasurementPointsWidgetState
    extends State<InsertMeasurementPointsWidget> {
  Map<String, List<MeasurementPoints>>? _measurementPoints;
  @override
  void initState() {
    super.initState();
    _measurementPoints = measurementPoints;
  }

  // final Debouncer _debouncer = Debouncer(milliseconds: 1000);
  final List<int> selectedItems = [];
  // void _onCheckboxChanged(bool? value, MeasurementPoints point) {
  //   if (value == true) {
  //     setState(() {
  //       selectedItems.add(point.id);
  //     });
  //     widget.setSelectedItems(selectedItems);
  //     return;
  //   }
  //   setState(() {
  //     selectedItems.removeWhere((id) => id == point.id);
  //   });
  //   widget.setSelectedItems(selectedItems);
  // }

  // void _onListTileTap(MeasurementPoints point) {
  //   if (selectedItems.contains(point.id) != true) {
  //     setState(() {
  //       selectedItems.add(point.id);
  //     });
  //     widget.setSelectedItems(selectedItems);
  //     return;
  //   }
  //   setState(() {
  //     selectedItems.removeWhere((id) => id == point.id);
  //   });
  //   widget.setSelectedItems(selectedItems);
  // }

  // void _onSearchChanged(String value) {
  //   _debouncer.run(() {
  //     if (value.isEmpty) {
  //       _measurementPoints = measurementPoints;
  //     }
  //     final filteredPoints = Map<String, List<MeasurementPoints>>.fromEntries(
  //       measurementPoints.entries
  //           .map((entry) {
  //             final filteredList = entry.value
  //                 .where(
  //                   (item) =>
  //                       item.name.toLowerCase().contains(value.toLowerCase()),
  //                 )
  //                 .toList();
  //             return MapEntry(entry.key, filteredList);
  //           })
  //           .where((entry) => entry.value.isNotEmpty),
  //     );
  //     setState(() {
  //       _measurementPoints = filteredPoints;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        slivers: _measurementPoints!.entries.expand((entry) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(
                entry.key.toUpperCase(),
                style: AppTextStyles.h4.copyWith(color: AppColors.accent),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final point = entry.value[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SpacerWidget(height: 10),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: AppColors.cardGradientBg,
                        borderRadius: index == 0
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )
                            : index == entry.value.length - 1
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                            : BorderRadius.zero,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(point.name, style: AppTextStyles.h3),
                                Text(point.hint, style: AppTextStyles.subtext),
                              ],
                            ),
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              SizedBox(
                                width: 60,
                                child: TextField(
                                  textAlign: TextAlign.end,
                                  controller: TextEditingController(
                                    text:
                                        widget.inputData.any(
                                          (item) => item['id'] == point.id,
                                        )
                                        ? widget.inputData
                                              .where(
                                                (item) =>
                                                    item['id'] == point.id,
                                              )
                                              .toList()
                                              .elementAt(0)['value']
                                        : "",
                                  ),
                                  onSubmitted: (value) {
                                    setState(() {
                                      widget.inputData.add({
                                        "value": value,
                                        "id": point.id,
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
                                    hintText: "--",

                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    fillColor: AppColors.bg,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.accent,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              Text(widget.unit.toUpperCase()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (index != entry.value.length - 1) Divider(height: 1),
                  ],
                );
              }, childCount: entry.value.length),
            ),
          ];
        }).toList(),
      ),
    );
  }
}
