import 'package:atomsbox_simple_news_app_with_bloc/extensions/extensions.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/news_repository.dart';
import '../../news_details/views/news_details_screen.dart';

import '../../../models/article.dart';

class NewsCategoryScreen extends StatelessWidget {
  const NewsCategoryScreen({
    super.key,
    required this.category,
  });

  static Route route({required NewsCategory category}) {
    return MaterialPageRoute(
      builder: (context) => NewsCategoryScreen(category: category),
    );
  }

  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    return NewsCategoryView(category: category);
  }
}

class NewsCategoryView extends StatelessWidget {
  const NewsCategoryView({
    super.key,
    required this.category,
  });

  final NewsCategory category;

  @override
  Widget build(BuildContext context) {
    List<Article> articles = Article.articles
        .where((article) => article.category?.name == category.name)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: SimpleText(
          category.name,
          textStyle: TextStyleEnum.headlineMedium,
        ),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleList(
                listItems: articles.map((article) {
                  return SimpleCard(
                      title: article.headline,
                      tagline: article.byline,
                      paragraph: article.leadParagraph,
                      labelText: article.category?.name.capitalize() ?? '',
                      imageUrl: article.imageUrl,
                      height: 200,
                      dense: false,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NewsDetailsScreen(
                                articleId: article.id,
                              );
                            },
                          ),
                        );
                      });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
