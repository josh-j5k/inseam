class MeasurementPoints {
  final int id;
  final String name;
  final String hint;
  final double? xManPercent;
  final double? yManPercent;
  final double? xWomanPercent;
  final double? yWomanPercent;
  final double? xChildPercent;
  final double? yChildPercent;
  final BodySide side;
  final Category category;
  const MeasurementPoints({
    required this.name,
    required this.hint,
    this.xManPercent,
    this.yManPercent,
    this.xWomanPercent,
    this.yWomanPercent,
    this.xChildPercent,
    this.yChildPercent,
    required this.side,
    required this.category,
    required this.id,
  });
}

enum BodySide { front, back }

enum Category { man, woman, child, all, female }

// class MeasurementData  {
//   const MeasurementData({})
// }
