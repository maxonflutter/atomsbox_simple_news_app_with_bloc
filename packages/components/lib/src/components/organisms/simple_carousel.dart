import 'package:carousel_slider/carousel_slider.dart';
import 'package:components/src/components.dart';
import 'package:flutter/material.dart';

class SimpleCarousel extends StatelessWidget {
  const SimpleCarousel({
    super.key,
    required this.carouselItems,
    this.title,
    this.autoPlay = true,
    this.enlargeCenterPage = true,
    this.enlargeFactor = 0.15,
    this.heightFactor = 0.25,
    this.viewportFraction = 0.8,
  });

  final List<Widget> carouselItems;
  final String? title;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final double enlargeFactor;
  final double heightFactor;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title != null)
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleText(
                  title!,
                  textStyle: TextStyleEnum.headlineSmall,
                ),
              )
            : const SizedBox(),
        CarouselSlider(
          options: CarouselOptions(
            height: size.height * heightFactor,
            viewportFraction: viewportFraction,
            enlargeCenterPage: enlargeCenterPage,
            enlargeFactor: enlargeFactor,
            autoPlay: autoPlay,
          ),
          items: carouselItems,
        ),
      ],
    );
  }
}
