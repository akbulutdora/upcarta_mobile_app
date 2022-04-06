import 'package:flutter/material.dart';

class Dimen {
  static const double parentMargin = 16.0;
  static const double regularMargin = 8.0;

  static get regularParentPadding => const EdgeInsets.all(parentMargin);

  // suggestion: 20 in android, 16 in iOS (18 might be ok for both)
}