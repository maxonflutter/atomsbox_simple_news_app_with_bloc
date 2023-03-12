import 'package:components/src/components.dart';
import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({
    super.key,
    required this.listItems,
    this.title,
  });

  final List<Widget> listItems;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null)
            ? [
                SimpleText(
                  title!,
                  textStyle: TextStyleEnum.headlineSmall,
                ),
                const SizedBox(height: 8.0)
              ]
            : [const SizedBox()],
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listItems.length,
          separatorBuilder: (context, index) {
            return Divider(
              indent: 16,
              endIndent: 16,
              color: Theme.of(context).colorScheme.onBackground.withAlpha(50),
            );
          },
          itemBuilder: (context, index) {
            return listItems[index];
          },
        ),
      ],
    );
  }
}
