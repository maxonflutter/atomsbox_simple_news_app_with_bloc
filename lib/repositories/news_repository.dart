import '../models/article.dart';

class NewsRepository {
  const NewsRepository();

  Future<Article> getArticleById(String id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Article.articles.where((article) => article.id == id).first;
  }

  Future<List<Article>> getPopularArticles() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Article.articles.where((article) => article.isPopular).toList();
  }

  Future<List<Article>> getBreakingNewsArticles() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Article.articles.where((article) => article.isBreakingNews).toList();
  }

  Future<List<Article>> getArticlesByCategory(NewsCategory category) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Article.articles
        .where((article) => article.category == category)
        .toList();
  }
}
