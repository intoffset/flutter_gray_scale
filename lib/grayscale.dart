/// A library that provides grayscale utilities for [ColorScheme] and [Color].
library grayscale;

import 'package:flutter/material.dart';

/// A [ColorScheme] extension that provides grayscale utilities.
extension GrayColorScheme on ColorScheme {
  /// Creates a high contrast grayscale [ColorScheme] based on the given [brightness].
  static ColorScheme highContrastGray(Brightness brightness) {
    return brightness == Brightness.light
        ? ColorScheme.highContrastLight(brightness: brightness).toGray()
        : ColorScheme.highContrastDark(brightness: brightness).toGray();
  }

  /// Converts a [ColorScheme] to grayscale.
  ColorScheme toGray() {
    final colorScheme = ColorScheme(
      primary: primary.toGray(),
      onPrimary: onPrimary.toGray(),
      primaryContainer: primaryContainer.toGray(),
      onPrimaryContainer: onPrimaryContainer.toGray(),
      secondary: secondary.toGray(),
      onSecondary: onSecondary.toGray(),
      secondaryContainer: secondaryContainer.toGray(),
      onSecondaryContainer: onSecondaryContainer.toGray(),
      tertiary: tertiary.toGray(),
      onTertiary: onTertiary.toGray(),
      tertiaryContainer: tertiaryContainer.toGray(),
      onTertiaryContainer: onTertiaryContainer.toGray(),
      error: error.toGray(),
      onError: onError.toGray(),
      errorContainer: errorContainer.toGray(),
      onErrorContainer: onErrorContainer.toGray(),
      outline: outline.toGray(),
      outlineVariant: outlineVariant.toGray(),
      background: background.toGray(),
      onBackground: onBackground.toGray(),
      surface: surface.toGray(),
      onSurface: onSurface.toGray(),
      surfaceVariant: surfaceVariant.toGray(),
      onSurfaceVariant: onSurfaceVariant.toGray(),
      inverseSurface: inverseSurface.toGray(),
      onInverseSurface: onInverseSurface.toGray(),
      inversePrimary: inversePrimary.toGray(),
      shadow: shadow.toGray(),
      scrim: scrim.toGray(),
      surfaceTint: surfaceTint.toGray(),
      brightness: brightness,
    );
    return colorScheme;
  }
}

/// A [Color] extension that provides grayscale utilities.
extension GrayColor on Color {
  /// Converts a [Color] to grayscale.
  Color toGray() {
    final gray = computeLuminance();
    return Color.fromRGBO(
        (gray * 255).toInt(), (gray * 255).toInt(), (gray * 255).toInt(), 1.0);
  }
}
