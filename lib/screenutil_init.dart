part of flutter_screenutil;

class ScreenUtilInit extends StatelessWidget {
  /// A helper widget that initializes [ScreenUtil]
  ScreenUtilInit({
    required this.builder,
    this.designSize = ScreenUtil.defaultSize,
    this.designPixelRatio = ScreenUtil.defaultPixelRatio,
    this.designMinWidthPixelRatio = ScreenUtil.defaultMinWidthPixelRatio,
    this.designMaxWidthPixelRatio = ScreenUtil.defaultMaxWidthPixelRatio,
    this.designMinHeightPixelRatio = ScreenUtil.defaultMinHeightPixelRatio,
    this.designMaxHeightPixelRatio = ScreenUtil.defaultMaxHeightPixelRatio,
    this.defaultNormalizeThreshold = ScreenUtil.defaultNormalizeThreshold,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;
  final double designPixelRatio;
  final double designMinWidthPixelRatio;
  final double designMaxWidthPixelRatio;
  final double designMinHeightPixelRatio;
  final double designMaxHeightPixelRatio;
  final double defaultNormalizeThreshold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, BoxConstraints constraints) {
      return OrientationBuilder(
        builder: (_, Orientation orientation) {
          if (constraints.maxWidth != 0) {
            ScreenUtil.init(
              constraints,
              orientation: orientation,
              designSize: designSize,
              designPixelRatio: designPixelRatio,
              designMinWidthPixelRatio: designMinWidthPixelRatio,
              designMaxWidthPixelRatio: designMaxWidthPixelRatio,
              designMinHeightPixelRatio: designMinHeightPixelRatio,
              designMaxHeightPixelRatio: designMaxHeightPixelRatio,
              defaultNormalizeThreshold: defaultNormalizeThreshold,
            );
            return builder();
          }
          return Container();
        },
      );
    });
  }
}
