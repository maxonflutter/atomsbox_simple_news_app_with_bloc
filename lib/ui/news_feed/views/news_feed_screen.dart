import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../extensions/extensions.dart';
import '../../../models/article.dart';
import '../../../repositories/repositories.dart';
import '../blocs/news_feed/news_feed_bloc.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const NewsFeedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsFeedBloc(newsRepository: context.read<NewsRepository>())
            ..add(NewsFeedStarted()),
      child: const NewsFeedView(),
    );
  }
}

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(
          'Breaking News',
          textStyle: TextStyleEnum.headlineMedium,
        ),
        actions: [
          SimpleIconButton(
            icon: Icons.notifications,
            colorPalette: ColorPalette.primaryContainer,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Container();
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: SimpleBottomNavBar(
        items: [
          SimpleIconButton(
            icon: Icons.home_filled,
            colorPalette: ColorPalette.primaryContainer,
            onPressed: () {
              // Navigator.push(context, NewsFeedScreen.route());
            },
          ),
          SimpleIconButton(
            icon: Icons.book_rounded,
            colorPalette: ColorPalette.primary,
            onPressed: () {
              /// TODO: Push Read Later screen
            },
          ),
          SimpleIconButton(
            icon: Icons.person,
            colorPalette: ColorPalette.primary,
            onPressed: () {
              /// TODO: Push Login screen
            },
          ),
        ],
      ),
      drawer: SimpleDrawer(
          drawerItems: NewsCategory.values.map(
            (value) {
              return SimpleListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   NewsCategoryScreen.route(category: value),
                  // );
                },
                title: value.name.capitalize(),
              );
            },
          ).toList(),
          drawerSecondaryItems: [
            SimpleListTile(
              onTap: () {},
              title: 'Settings',
              leading: const Icon(Icons.settings),
            ),
          ]),
      extendBody: true,
      body: BlocBuilder<NewsFeedBloc, NewsFeedState>(
        builder: (context, state) {
          if (state.status == NewsFeedStatus.initial ||
              state.status == NewsFeedStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == NewsFeedStatus.loaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  (state.breakingNewsArticles.isNotEmpty)
                      ? SimpleCarousel(
                          carouselItems: state.breakingNewsArticles.map(
                            (article) {
                              return SimpleCard(
                                title: article.headline,
                                tagline: article.byline,
                                labelText:
                                    article.category?.name.capitalize() ?? '',
                                imageUrl: article.imageUrl,
                              );
                            },
                          ).toList(),
                        )
                      : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: (state.popularArticles.isNotEmpty)
                        ? AnimateInEffectWrapper(
                            child: SimpleList(
                              title: 'Popular',
                              listItems: state.popularArticles.map(
                                (article) {
                                  return SimpleListTile(
                                    title: article.headline,
                                    subtitle: article.byline,
                                    tagline:
                                        article.category?.name.capitalize() ??
                                            '',
                                    leading: SimpleImage(
                                      imageUrl: article.imageUrl,
                                      height: size.height * 0.15,
                                      width: size.height * 0.15,
                                    ),
                                    onTap: () {},
                                  );
                                },
                              ).toList(),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
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
