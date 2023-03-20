import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../extensions/extensions.dart';
import '../../../repositories/news_repository.dart';
import '../../news_details/views/news_details_screen.dart';

import '../../../models/article.dart';
import '../blocs/news_category/news_category_bloc.dart';

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
    return BlocProvider(
        create: (context) =>
            NewsCategoryBloc(newsRepository: context.read<NewsRepository>())
              ..add(NewsCategoryStarted(category: category)),
        child: NewsCategoryView(category: category));
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
    NewsCategory? category = context.select(
      (NewsCategoryBloc bloc) => bloc.state.category,
    );

    return Scaffold(
      appBar: AppBar(
        title: SimpleText(
          category?.name ?? '',
          textStyle: TextStyleEnum.headlineMedium,
        ),
      ),
      extendBody: true,
      body: BlocBuilder<NewsCategoryBloc, NewsCategoryState>(
        builder: (context, state) {
          if (state.status == NewsCategoryStatus.initial ||
              state.status == NewsCategoryStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == NewsCategoryStatus.loaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleList(
                      listItems: state.articles.map((article) {
                        return SimpleCard(
                            title: article.headline,
                            tagline: article.byline,
                            paragraph: article.leadParagraph,
                            labelText:
                                article.category?.name.capitalize() ?? '',
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
            );
          } else {
            return const SimpleText(
              'Something went wrong',
              textStyle: TextStyleEnum.bodyLarge,
            );
          }
        },
      ),
    );
  }
}
