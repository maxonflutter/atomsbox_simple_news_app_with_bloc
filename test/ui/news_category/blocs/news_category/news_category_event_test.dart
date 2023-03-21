import 'package:atomsbox_simple_news_app_with_bloc/models/article.dart';
import 'package:atomsbox_simple_news_app_with_bloc/ui/news_category/blocs/news_category/news_category_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NewsCategoryEvent', () {
    const mockCategory = NewsCategory.economy;

    group('NewsCategoryStarted', () {
      test('supports value equality', () {
        expect(
          const NewsCategoryStarted(category: mockCategory),
          equals(const NewsCategoryStarted(category: mockCategory)),
        );
      });

      test('props are correct', () {
        expect(
          const NewsCategoryStarted(category: mockCategory).props,
          equals(<Object?>[mockCategory]),
        );
      });
    });
  });
}
