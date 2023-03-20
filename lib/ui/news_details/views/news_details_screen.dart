import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/news_repository.dart';
import '../blocs/news_details/news_details_bloc.dart';

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
    return BlocProvider(
      create: (context) =>
          NewsDetailsBloc(newsRepository: context.read<NewsRepository>())
            ..add(NewsDetailsStarted(articleId)),
      child: const NewsDetailsView(),
    );
  }
}

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
        builder: (context, state) {
          if (state.status == NewsDetailsStatus.initial ||
              state.status == NewsDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == NewsDetailsStatus.loaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleImage(
                      height: 200,
                      imageUrl: state.article.imageUrl,
                    ),
                    const SizedBox(height: 8.0),
                    SimpleText(
                      state.article.category?.name ?? '',
                      color: Theme.of(context).colorScheme.secondary,
                      textStyle: TextStyleEnum.bodySmall,
                    ),
                    SimpleText(
                      state.article.headline,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyleEnum.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    SimpleText(
                      state.article.byline,
                      textStyle: TextStyleEnum.bodySmall,
                    ),
                    const SizedBox(height: 8.0),
                    AnimateInEffectWrapper(
                      child: SimpleText(
                        state.article.leadParagraph,
                        textStyle: TextStyleEnum.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ...state.article.supportingParagraph.map((paragraph) {
                      return AnimateInEffectWrapper(
                        child: Column(
                          children: [
                            SimpleText(
                              state.article.leadParagraph,
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
