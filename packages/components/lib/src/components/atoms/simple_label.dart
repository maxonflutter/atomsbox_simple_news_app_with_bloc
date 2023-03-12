import 'package:flutter/material.dart';

import 'simple_app_theme.dart';
import 'simple_constants.dart';
import 'simple_text.dart';

class SimpleLabel extends StatelessWidget {
  const SimpleLabel({
    super.key,
    this.text = 'Sport',
    this.icon = Icons.sports_football,
    this.colorPalette = ColorPalette.primary,
  });

  final String text;
  final IconData icon;
  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) {
    final colorScheme = simpleAppTheme().colorScheme;

    Color backgroundColor;
    Color foregroundColor;

    switch (colorPalette) {
      case ColorPalette.secondary:
        backgroundColor = colorScheme.secondary;
        foregroundColor = colorScheme.onSecondary;
        break;
      case ColorPalette.primaryContainer:
        backgroundColor = colorScheme.primaryContainer;
        foregroundColor = colorScheme.onPrimaryContainer;
        break;
      default:
        backgroundColor = colorScheme.primary;
        foregroundColor = colorScheme.onPrimary;
    }

    return Container(
      padding: const EdgeInsets.all(SimpleConstants.sm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Row(
        children: [
          Icon(icon, color: foregroundColor),
          const SizedBox(width: SimpleConstants.sm),
          SimpleText(
            text,
            color: foregroundColor,
            textStyle: TextStyleEnum.bodyMedium,
          ),
        ],
      ),
    );
  }
}
