// Objectives: This file is responsible for providing extensions to several classes in the project.

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // ScreenInfo
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;
}
