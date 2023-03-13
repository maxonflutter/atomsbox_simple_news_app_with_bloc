import 'package:components/components.dart';
import 'package:flutter/material.dart';

class SimpleBottomNavBar extends StatelessWidget {
  const SimpleBottomNavBar({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(
        horizontal: SimpleConstants.xlg,
        vertical: SimpleConstants.lg,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(200),
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
      ),
    );
  }
}
