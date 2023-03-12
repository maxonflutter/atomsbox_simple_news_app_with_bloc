import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ColorPalette {
  primary,
  secondary,
  tertiary,
  primaryContainer,
  secondaryContainer,
  tertiaryContainer
}

ThemeData simpleAppTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      displayLarge: GoogleFonts.abrilFatface(),
      displayMedium: GoogleFonts.abrilFatface(),
      displaySmall: GoogleFonts.abrilFatface(),
      headlineLarge: GoogleFonts.abrilFatface(),
      headlineMedium: GoogleFonts.abrilFatface(),
      headlineSmall: GoogleFonts.abrilFatface(),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.abrilFatface(
        textStyle: ThemeData().textTheme.headlineLarge,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primarySwatch,
      onPrimary: primarySwatch[100]!,
      primaryContainer: primarySwatch[90]!,
      onPrimaryContainer: primarySwatch[10]!,
      secondary: secondarySwatch,
      onSecondary: secondarySwatch[100]!,
      secondaryContainer: secondarySwatch[90]!,
      onSecondaryContainer: secondarySwatch[10]!,
      tertiary: tertiarySwatch,
      onTertiary: tertiarySwatch[100]!,
      tertiaryContainer: tertiarySwatch[90]!,
      onTertiaryContainer: tertiarySwatch[10]!,
      error: errorSwatch,
      onError: errorSwatch[100]!,
      background: neutralSwatch[99]!,
      onBackground: neutralSwatch[10]!,
      surface: neutralSwatch[99]!,
      onSurface: neutralSwatch[10]!,
      surfaceVariant: neutralVariantSwatch[90]!,
      onSurfaceVariant: neutralVariantSwatch[30]!,
      outline: neutralVariantSwatch[50]!,
    ),
  );
}

/// Primary: #006494
final primarySwatch = MaterialColor(0xFF006494, primaryColor);

/// Secondary: #9a4521
final secondarySwatch = MaterialColor(0xFF9a4521, secondaryColor);

/// Tertiary: #006a66
final tertiarySwatch = MaterialColor(0xFF006a66, tertiaryColor);

/// Error: #9b4054
final errorSwatch = MaterialColor(0xFF9b4054, errorColor);

/// Neutral: #eff1f1
final neutralSwatch = MaterialColor(0xFFeff1f1, neutralColor);

/// Neutral Variant: #e9f2f4
final neutralVariantSwatch = MaterialColor(0xFFe9f2f4, neutralVariantColor);

Map<int, Color> primaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF001220),
  10: const Color(0xFF001e30),
  20: const Color(0xFF00344f),
  25: const Color(0xFF003f60),
  30: const Color(0xFF004b71),
  35: const Color(0xFF005782),
  40: const Color(0xFF006494),
  50: const Color(0xFF0b7eb8),
  60: const Color(0xFF3b98d4),
  70: const Color(0xFF5cb3f0),
  80: const Color(0xFF8ecdff),
  90: const Color(0xFFcbe6ff),
  95: const Color(0xFFe6f2ff),
  98: const Color(0xFFf6f9ff),
  99: const Color(0xFFfcfcff),
  100: const Color(0xFFffffff)
};

Map<int, Color> secondaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF260700),
  10: const Color(0xFF370e00),
  20: const Color(0xFF5a1c00),
  25: const Color(0xFF6c2401),
  30: const Color(0xFF7b2f0b),
  35: const Color(0xFF8a3a16),
  40: const Color(0xFF9a4521),
  50: const Color(0xFFb95d37),
  60: const Color(0xFFd9754d),
  70: const Color(0xFFf98f65),
  80: const Color(0xFFffb599),
  90: const Color(0xFFffdbce),
  95: const Color(0xFFffede7),
  98: const Color(0xFFfff8f6),
  99: const Color(0xFFfffbff),
  100: const Color(0xFFffffff)
};

Map<int, Color> tertiaryColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF001413),
  10: const Color(0xFF00201e),
  20: const Color(0xFF003735),
  25: const Color(0xFF004340),
  30: const Color(0xFF00504d),
  35: const Color(0xFF005d59),
  40: const Color(0xFF006a66),
  50: const Color(0xFF008580),
  60: const Color(0xFF00a29c),
  70: const Color(0xFF23beb8),
  80: const Color(0xFF4edad3),
  90: const Color(0xFF70f7ef),
  95: const Color(0xFFb0fff9),
  98: const Color(0xFFe3fffc),
  99: const Color(0xFFf2fffd),
  100: const Color(0xFFffffff)
};
Map<int, Color> neutralColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF0e1212),
  10: const Color(0xFF191c1d),
  20: const Color(0xFF2e3132),
  25: const Color(0xFF393c3d),
  30: const Color(0xFF444748),
  35: const Color(0xFF505354),
  40: const Color(0xFF5c5f5f),
  50: const Color(0xFF747878),
  60: const Color(0xFF8e9192),
  70: const Color(0xFFa9acac),
  80: const Color(0xFFc4c7c7),
  90: const Color(0xFFe1e3e3),
  95: const Color(0xFFeff1f1),
  98: const Color(0xFFf8fafa),
  99: const Color(0xFFfafdfd),
  100: const Color(0xFFffffff)
};
Map<int, Color> neutralVariantColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF091214),
  10: const Color(0xFF141d1f),
  20: const Color(0xFF293234),
  25: const Color(0xFF343d3f),
  30: const Color(0xFF3f484a),
  35: const Color(0xFF4b5456),
  40: const Color(0xFF576062),
  50: const Color(0xFF6f797a),
  60: const Color(0xFF899294),
  70: const Color(0xFFa3adaf),
  80: const Color(0xFFbfc8ca),
  90: const Color(0xFFdbe4e6),
  95: const Color(0xFFe9f2f4),
  98: const Color(0xFFf2fbfd),
  99: const Color(0xFFf6feff),
  100: const Color(0xFFffffff)
};

Map<int, Color> errorColor = {
  0: const Color(0xFF000000),
  5: const Color(0xFF2c000b),
  10: const Color(0xFF400014),
  20: const Color(0xFF5f1127),
  25: const Color(0xFF6e1d32),
  30: const Color(0xFF7d293d),
  35: const Color(0xFF8c3448),
  40: const Color(0xFF9b4054),
  50: const Color(0xFFba586c),
  60: const Color(0xFFd97185),
  70: const Color(0xFFf88a9f),
  80: const Color(0xFFffb2be),
  90: const Color(0xFFffd9de),
  95: const Color(0xFFffecee),
  98: const Color(0xFFfff8f7),
  99: const Color(0xFFfffbff),
  100: const Color(0xFFffffff),
};
