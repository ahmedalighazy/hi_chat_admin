import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;

  ResponsiveUtils(this.context);

  // Get screen size
  Size get screenSize => MediaQuery.of(context).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Device type checks
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Responsive font sizes
  double fontSize(double size) {
    if (isMobile) return size;
    if (isTablet) return size * 1.2;
    return size * 1.4;
  }

  // Responsive spacing
  double spacing(double space) {
    if (isMobile) return space;
    if (isTablet) return space * 1.3;
    return space * 1.5;
  }

  // Responsive padding
  EdgeInsets padding(double value) {
    return EdgeInsets.all(spacing(value));
  }

  EdgeInsets paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: spacing(horizontal),
      vertical: spacing(vertical),
    );
  }

  // Responsive width percentage
  double widthPercentage(double percentage) {
    return screenWidth * (percentage / 100);
  }

  // Responsive height percentage
  double heightPercentage(double percentage) {
    return screenHeight * (percentage / 100);
  }

  // Responsive icon size
  double iconSize(double size) {
    if (isMobile) return size;
    if (isTablet) return size * 1.3;
    return size * 1.5;
  }

  // Responsive border radius
  double borderRadius(double radius) {
    if (isMobile) return radius;
    if (isTablet) return radius * 1.2;
    return radius * 1.3;
  }

  // Get max width for content
  double get maxContentWidth {
    if (isMobile) return screenWidth;
    if (isTablet) return 600;
    return 800;
  }

  // Responsive SizedBox
  SizedBox heightBox(double height) {
    return SizedBox(height: spacing(height));
  }

  SizedBox widthBox(double width) {
    return SizedBox(width: spacing(width));
  }

  // Orientation check
  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;
  bool get isLandscape => MediaQuery.of(context).orientation == Orientation.landscape;

  // Get responsive value based on device type
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
}

extension ResponsiveExtension on BuildContext {
  ResponsiveUtils get responsive => ResponsiveUtils(this);
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ResponsiveUtils responsive) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context, ResponsiveUtils(context));
  }
}

// Responsive Container
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? responsive.maxContentWidth,
        ),
        padding: padding ?? responsive.padding(24),
        child: child,
      ),
    );
  }
}