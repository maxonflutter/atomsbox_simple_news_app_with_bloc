import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../models/article.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const NewsFeedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NewsFeedView();
  }
}

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Article> articles = Article.articles;
    List<Article> popularNews =
        Article.articles.where((article) => article.isPopular).toList();
    List<Article> breakingNews =
        Article.articles.where((article) => article.isBreakingNews).toList();

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
        // drawerSecondaryItems: [
        //   SimpleListTile(
        //     onTap: () {},
        //     title: 'Settings',
        //     leading: const Icon(Icons.settings),
        //   ),
        // ],
      ),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            SimpleCarousel(
              carouselItems: breakingNews.map(
                (article) {
                  return SimpleCard(
                    title: article.headline,
                    tagline: article.byline,
                    labelText: article.category?.name.capitalize() ?? '',
                    imageUrl: article.imageUrl,
                  );
                },
              ).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AnimateInEffectWrapper(
                child: SimpleList(
                  title: 'Popular',
                  listItems: popularNews.map(
                    (article) {
                      return SimpleListTile(
                        title: article.headline,
                        subtitle: article.byline,
                        tagline: article.category?.name.capitalize() ?? '',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
