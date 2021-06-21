part of flutter_screenutil;

class ScreenUtilInit extends StatelessWidget {
  /// A helper widget that initializes [ScreenUtil]
  ScreenUtilInit({
    required this.builder,
    this.designSize = ScreenUtil.defaultSize,
    this.designPixelRatio = ScreenUtil.defaultPixelRatio,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  /// The [Size] of the device in the design draft, in dp
  final Size designSize;
  final double designPixelRatio;

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
            );
            return builder();
          }
          return Container();
        },
      );
    });
  }
}
