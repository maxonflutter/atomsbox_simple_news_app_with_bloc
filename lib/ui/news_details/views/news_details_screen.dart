import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    super.key,
    required this.articleId,
  });

  final String articleId;

  static Route route({required String articleId}) {
    return MaterialPageRoute(
      builder: (context) => NewsDetailsScreen(articleId: articleId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NewsDetailsView(articleId: articleId);
  }
}

class NewsDetailsView extends StatelessWidget {
  final String articleId;
  const NewsDetailsView({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    final Article article =
        Article.articles.where((article) => article.id == articleId).first;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SimpleIconButton(
            icon: Icons.bookmark,
            onPressed: () {},
          ),
          SimpleIconButton(
            icon: Icons.share,
            colorPalette: ColorPalette.primaryContainer,
            onPressed: () {},
          ),
          const SizedBox(width: 16.0)
        ],
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleImage(
                height: 200,
                imageUrl: article.imageUrl,
              ),
              const SizedBox(height: 8.0),
              SimpleText(
                article.category?.name ?? '',
                color: Theme.of(context).colorScheme.secondary,
                textStyle: TextStyleEnum.bodySmall,
              ),
              SimpleText(
                article.headline,
                maxLines: 2,
                fontWeight: FontWeight.bold,
                textStyle: TextStyleEnum.bodyLarge,
              ),
              const SizedBox(height: 4.0),
              SimpleText(
                article.byline,
                textStyle: TextStyleEnum.bodySmall,
              ),
              const SizedBox(height: 8.0),
              AnimateInEffectWrapper(
                child: SimpleText(
                  article.leadParagraph,
                  textStyle: TextStyleEnum.bodyMedium,
                ),
              ),
              const SizedBox(height: 8.0),
              ...article.supportingParagraph.map((paragraph) {
                return AnimateInEffectWrapper(
                  child: Column(
                    children: [
                      SimpleText(
                        article.leadParagraph,
                        textStyle: TextStyleEnum.bodyMedium,
                      ),
                      const SizedBox(height: 8.0)
                    ],
                  ),
                );
              }),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
