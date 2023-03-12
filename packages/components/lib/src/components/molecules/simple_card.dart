import 'dart:ui';

import 'package:flutter/material.dart';

import '../../components.dart';
import '../atoms/simple_label.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.paragraph,
    this.tagline,
    this.labelText,
    this.width = double.infinity,
    this.height = 400,
    this.dense = true,
    this.onTap,
  });

  final String imageUrl;
  final String title;
  final String? paragraph;
  final String? tagline;
  final String? labelText;
  final double width;
  final double height;
  final bool dense;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var _image;
    var _title;
    var _paragraph;
    var _tagline;
    var _chip;

    _image = SimpleImage(
      imageUrl: imageUrl,
      width: double.infinity,
      height: 150,
    );

    _title = SimpleText(
      title,
      maxLines: 2,
      color: dense ? Theme.of(context).colorScheme.onPrimary : null,
      textStyle: TextStyleEnum.headlineSmall,
    );

    if (tagline != null) {
      _tagline = SimpleText(
        tagline!,
        color: dense ? Theme.of(context).colorScheme.onPrimary : null,
        textStyle: TextStyleEnum.bodyMedium,
      );
    }

    if (paragraph != null) {
      _paragraph = SimpleText(
        paragraph!,
        maxLines: 3,
        textStyle: TextStyleEnum.bodyMedium,
      );
    }

    if (labelText != null) {
      _chip = SimpleLabel(
        text: labelText!,
        colorPalette: ColorPalette.primaryContainer,
      );
    }

    return InkWell(
      onTap: onTap,
      child: dense
          ? _buildSimpleCardDense(
              context,
              size,
              _image,
              _tagline,
              _title,
              _chip,
            )
          : _buildSimpleCardExpanded(
              _image,
              _tagline,
              _title,
              _paragraph,
            ),
    );
  }

  Column _buildSimpleCardExpanded(
    _image,
    _tagline,
    _title,
    _paragraph,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image,
        const SizedBox(height: 8.0),
        ...(tagline != null)
            ? [_tagline, const SizedBox(height: 8.0)]
            : [const SizedBox()],
        _title,
        const SizedBox(height: 8.0),
        ...(paragraph != null)
            ? [_paragraph, const SizedBox(height: 8.0)]
            : [const SizedBox()],
      ],
    );
  }

  Container _buildSimpleCardDense(
    BuildContext context,
    Size size,
    _image,
    _tagline,
    _title,
    _chip,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SimpleConstants.borderRadius),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: _image),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SimpleConstants.borderRadius,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primary.withAlpha(150),
                    Theme.of(context).colorScheme.primary,
                  ],
                  stops: const [0.2, 0.6, 1],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: SimpleConstants.lg,
            left: SimpleConstants.lg,
            child: SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (tagline != null) ? _tagline : const SizedBox(),
                  _title,
                ],
              ),
            ),
          ),
          (labelText != null)
              ? Positioned(
                  left: SimpleConstants.lg,
                  top: SimpleConstants.lg,
                  child: _chip,
                )
              : Container(),
        ],
      ),
    );
  }
}
