import 'package:components/components.dart';
import 'package:flutter/material.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({
    super.key,
    required this.drawerItems,
    this.drawerSecondaryItems,
  });

  final List<Widget> drawerItems;
  final List<Widget>? drawerSecondaryItems;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: Show an image logo, add it as input
              const SizedBox(
                height: 100,
                child: SimpleText(
                  SimpleConstants.appName,
                  textStyle: TextStyleEnum.headlineMedium,
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [...drawerItems],
                ),
              ),
              ...(drawerSecondaryItems != null)
                  ? [
                      const Spacer(),
                      const Divider(),
                      ...drawerSecondaryItems!,
                    ]
                  : [const SizedBox()],
            ],
          ),
        ),
      ),
    );
  }
}
