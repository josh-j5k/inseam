import 'package:flutter/material.dart';
import 'package:inseam/core/theme/app_colors.dart';
import 'package:inseam/core/theme/app_spacing.dart';
import 'package:inseam/core/theme/app_text_styles.dart';
import 'package:inseam/core/widgets/spacer_widget.dart';
import 'package:inseam/features/measure/data/measurement_points.dart';
import 'package:inseam/features/measure/data/models/measurement_points.dart';
import 'package:inseam/core/utils/debouncer.dart';

class MeasurementPointsWidget extends StatefulWidget {
  final void Function(List<int> selectedItems) setSelectedItems;
  final AppSpacing spacing;
  const MeasurementPointsWidget({
    super.key,
    required this.spacing,
    required this.setSelectedItems,
  });

  @override
  State<MeasurementPointsWidget> createState() =>
      _MeasurementPointsWidgetState();
}

class _MeasurementPointsWidgetState extends State<MeasurementPointsWidget> {
  Map<String, List<MeasurementPoints>>? _measurementPoints;
  @override
  void initState() {
    super.initState();
    _measurementPoints = measurementPoints;
  }

  final Debouncer _debouncer = Debouncer(milliseconds: 1000);
  final List<int> selectedItems = [];
  void _onCheckboxChanged(bool? value, MeasurementPoints point) {
    if (value == true) {
      setState(() {
        selectedItems.add(point.id);
      });
      widget.setSelectedItems(selectedItems);
      return;
    }
    setState(() {
      selectedItems.removeWhere((id) => id == point.id);
    });
    widget.setSelectedItems(selectedItems);
  }

  void _onListTileTap(MeasurementPoints point) {
    if (selectedItems.contains(point.id) != true) {
      setState(() {
        selectedItems.add(point.id);
      });
      widget.setSelectedItems(selectedItems);
      return;
    }
    setState(() {
      selectedItems.removeWhere((id) => id == point.id);
    });
    widget.setSelectedItems(selectedItems);
  }

  void _onSearchChanged(String value) {
    _debouncer.run(() {
      if (value.isEmpty) {
        _measurementPoints = measurementPoints;
      }
      final filteredPoints = Map<String, List<MeasurementPoints>>.fromEntries(
        measurementPoints.entries
            .map((entry) {
              final filteredList = entry.value
                  .where(
                    (item) =>
                        item.name.toLowerCase().contains(value.toLowerCase()),
                  )
                  .toList();
              return MapEntry(entry.key, filteredList);
            })
            .where((entry) => entry.value.isNotEmpty),
      );
      setState(() {
        _measurementPoints = filteredPoints;
      });
    });
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          onChanged: (String value) {
            _onSearchChanged(value);
          },
          hintText: "Search points e.g Neck, Waist...",
          leading: Icon(Icons.search),
        ),
        CustomScrollView(
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
                    children: [
                      Container(
                        // padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          gradient: AppColors.cardGradientBg,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          onTap: () => _onListTileTap(point),
                          leading: Icon(Icons.list_rounded),
                          title: Text(point.name, style: AppTextStyles.h4),
                          subtitle: Text(
                            point.hint,
                            style: AppTextStyles.subtext,
                          ),
                          trailing: Checkbox(
                            activeColor: AppColors.accent,

                            shape: CircleBorder(),
                            value:
                                selectedItems.isNotEmpty &&
                                selectedItems.contains(point.id),
                            onChanged: (value) =>
                                _onCheckboxChanged(value, point),
                          ),
                        ),
                      ),
                      SpacerWidget(height: widget.spacing.dividerSm()),
                    ],
                  );
                }, childCount: entry.value.length),
              ),
            ];
          }).toList(),
        ),
      ],
    );
  }
}
