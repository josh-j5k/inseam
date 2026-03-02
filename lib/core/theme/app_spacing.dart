class AppSpacing {
  final double height;
  final double width;
  const AppSpacing({required this.height, required this.width});
  double dividerSm() => height * 0.015;
  double dividerMd() => height * 0.02;
  double dividerLg() => height * 0.03;
  double dividerXl() => height * 0.04;
  double paddingXAxisSm() => width * 0.01;
  double paddingXAxisMd() => width * 0.02;
  double paddingXAxisLg() => width * 0.03;
  double paddingXAxisXl() => width * 0.04;
  double paddingYAxisSm() => height * 0.01;
  double paddingYAxisMd() => height * 0.02;
  double paddingYAxisLg() => height * 0.03;
  double paddingYAxisXl() => height * 0.04;
}
