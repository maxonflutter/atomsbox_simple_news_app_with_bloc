// Mocks generated by Mockito 5.4.0 from annotations
// in atomsbox_simple_news_app_with_bloc/test/ui/news_category/blocs/news_category/news_category_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:atomsbox_simple_news_app_with_bloc/models/article.dart' as _i2;
import 'package:atomsbox_simple_news_app_with_bloc/models/author.dart' as _i3;
import 'package:atomsbox_simple_news_app_with_bloc/repositories/news_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeArticle_0 extends _i1.SmartFake implements _i2.Article {
  _FakeArticle_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthor_1 extends _i1.SmartFake implements _i3.Author {
  _FakeAuthor_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NewsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRepository extends _i1.Mock implements _i4.NewsRepository {
  MockNewsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Article> getArticleById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getArticleById,
          [id],
        ),
        returnValue: _i5.Future<_i2.Article>.value(_FakeArticle_0(
          this,
          Invocation.method(
            #getArticleById,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Article>);
  @override
  _i5.Future<List<_i2.Article>> getPopularArticles() => (super.noSuchMethod(
        Invocation.method(
          #getPopularArticles,
          [],
        ),
        returnValue: _i5.Future<List<_i2.Article>>.value(<_i2.Article>[]),
      ) as _i5.Future<List<_i2.Article>>);
  @override
  _i5.Future<List<_i2.Article>> getBreakingNewsArticles() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBreakingNewsArticles,
          [],
        ),
        returnValue: _i5.Future<List<_i2.Article>>.value(<_i2.Article>[]),
      ) as _i5.Future<List<_i2.Article>>);
  @override
  _i5.Future<List<_i2.Article>> getArticlesByCategory(
          _i2.NewsCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArticlesByCategory,
          [category],
        ),
        returnValue: _i5.Future<List<_i2.Article>>.value(<_i2.Article>[]),
      ) as _i5.Future<List<_i2.Article>>);
}

/// A class which mocks [Article].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticle extends _i1.Mock implements _i2.Article {
  MockArticle() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  _i3.Author get author => (super.noSuchMethod(
        Invocation.getter(#author),
        returnValue: _FakeAuthor_1(
          this,
          Invocation.getter(#author),
        ),
      ) as _i3.Author);
  @override
  String get headline => (super.noSuchMethod(
        Invocation.getter(#headline),
        returnValue: '',
      ) as String);
  @override
  String get leadParagraph => (super.noSuchMethod(
        Invocation.getter(#leadParagraph),
        returnValue: '',
      ) as String);
  @override
  List<String> get supportingParagraph => (super.noSuchMethod(
        Invocation.getter(#supportingParagraph),
        returnValue: <String>[],
      ) as List<String>);
  @override
  String get imageUrl => (super.noSuchMethod(
        Invocation.getter(#imageUrl),
        returnValue: '',
      ) as String);
  @override
  bool get isBreakingNews => (super.noSuchMethod(
        Invocation.getter(#isBreakingNews),
        returnValue: false,
      ) as bool);
  @override
  bool get isPopular => (super.noSuchMethod(
        Invocation.getter(#isPopular),
        returnValue: false,
      ) as bool);
  @override
  String get byline => (super.noSuchMethod(
        Invocation.getter(#byline),
        returnValue: '',
      ) as String);
}