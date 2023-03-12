import 'package:components/components.dart';
import 'package:flutter/material.dart';

class SimpleListTile extends StatelessWidget {
  const SimpleListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.tagline,
    this.leading,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final String? tagline;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50.0),
        child: Row(
          children: [
            (leading != null) ? leading! : const SizedBox(),
            const SizedBox(width: 8.0),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (tagline != null)
                      ? SimpleText(
                          tagline!,
                          color: Theme.of(context).colorScheme.secondary,
                          textStyle: TextStyleEnum.bodySmall,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 4.0),
                  SimpleText(
                    title,
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyleEnum.bodyMedium,
                  ),
                  const SizedBox(height: 4.0),
                  (subtitle != null)
                      ? SimpleText(
                          subtitle!,
                          textStyle: TextStyleEnum.bodySmall,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
