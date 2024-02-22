import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gray_scale/gray_scale.dart';

void main() {
  test('generate gray scale color scheme', () {
    final colorSchemeLight = ColorSchemeGray.highContrastGray(Brightness.light);
    final colorSchemeDark = ColorSchemeGray.highContrastGray(Brightness.dark);
    expect(colorSchemeLight.brightness, Brightness.light);
    expect(colorSchemeDark.brightness, Brightness.dark);
  });
}
