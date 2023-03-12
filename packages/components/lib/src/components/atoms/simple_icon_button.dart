import 'package:components/components.dart';
import 'package:flutter/material.dart';

class SimpleIconButton extends StatelessWidget {
  const SimpleIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.colorPalette = ColorPalette.primary,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final colorScheme = simpleAppTheme().colorScheme;

    Color backgroundColor;
    Color foregroundColor;
    Color highlightColor;

    switch (colorPalette) {
      case ColorPalette.primaryContainer:
        backgroundColor = colorScheme.primaryContainer;
        foregroundColor = colorScheme.onPrimaryContainer;
        highlightColor = colorScheme.onPrimary;
        break;
      case ColorPalette.secondary:
        backgroundColor = colorScheme.secondary;
        foregroundColor = colorScheme.onSecondary;
        highlightColor = colorScheme.onSecondaryContainer;
        break;
      case ColorPalette.secondaryContainer:
        backgroundColor = colorScheme.secondaryContainer;
        foregroundColor = colorScheme.onSecondaryContainer;
        highlightColor = colorScheme.onSecondary;
        break;
      default:
        backgroundColor = colorScheme.primary;
        foregroundColor = colorScheme.onPrimary;
        highlightColor = colorScheme.onPrimaryContainer;
    }

    final disabledBackgroundColor = colorScheme.surface;
    final disabledForegroundColor = colorScheme.onSurface;

    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        highlightColor: highlightColor,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
