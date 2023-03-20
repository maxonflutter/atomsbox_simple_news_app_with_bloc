import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'exceptions.dart';

class NewsApiClient {
  NewsApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  /// Create an instance of [NewsApiClient] that integrates
  /// with the remote API.
  ///
  NewsApiClient({http.Client? httpClient})
      : this._(
          baseUrl: 'https://example-api.a.run.app',
          httpClient: httpClient,
        );

  /// Create an instance of [NewsApiClient] that integrates
  /// with a local instance of the API (http://localhost:8080).
  ///
  NewsApiClient.localhost({
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'http://localhost:8080',
          httpClient: httpClient,
        );

  final String _baseUrl;
  final http.Client _httpClient;

  /// GET /articles/<id>
  ///
  /// Supported parameters:
  /// * [id] - Article id for which content is requested.
  Future<T> getArticleById<T>({
    required String id,
    required T Function(Map<String, dynamic> data) objectMapper,
  }) async {
    final uri = Uri.parse('$_baseUrl/articles/$id');

    final response = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(),
    );

    final body = response.json();

    if (response.statusCode != HttpStatus.ok) {
      throw NewsApiRequestFailure(
        body: body,
        statusCode: response.statusCode,
      );
    }
    return objectMapper(body);
  }

  /// GET /articles/breaking-news
  ///
  Future<List<T>> getArticlesByCategory<T>({
    required String newsCategory,
    required T Function(Map<String, dynamic> data) objectMapper,
  }) async {
    final uri = Uri.parse('$_baseUrl/articles/category').replace(
      queryParameters: <String, dynamic>{
        'newsCategory': newsCategory,
      },
    );

    final response = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(),
    );

    final body = response.json();

    if (response.statusCode != HttpStatus.ok) {
      throw NewsApiRequestFailure(
        body: body,
        statusCode: response.statusCode,
      );
    }

    final results = body['results'] as List;

    return results.map((result) {
      return objectMapper(result);
    }).toList();
  }

  /// GET /articles/popular
  ///
  Future<List<T>> getPopularArticles<T>({
    required T Function(Map<String, dynamic> data) objectMapper,
  }) async {
    final uri = Uri.parse('$_baseUrl/articles/popular');

    final response = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(),
    );

    final body = response.json();

    if (response.statusCode != HttpStatus.ok) {
      throw NewsApiRequestFailure(
        body: body,
        statusCode: response.statusCode,
      );
    }

    final results = body['results'] as List;

    return results.map((result) {
      return objectMapper(result);
    }).toList();
  }

  /// GET /articles/breaking-news
  ///
  Future<List<T>> getBreakingNewsArticles<T>({
    required T Function(Map<String, dynamic> data) objectMapper,
  }) async {
    final uri = Uri.parse('$_baseUrl/articles/breaking');

    final response = await _httpClient.get(
      uri,
      headers: await _getRequestHeaders(),
    );

    final body = response.json();

    if (response.statusCode != HttpStatus.ok) {
      throw NewsApiRequestFailure(
        body: body,
        statusCode: response.statusCode,
      );
    }

    final results = body['results'] as List;

    return results.map((result) {
      return objectMapper(result);
    }).toList();
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
    };
  }
}

extension on http.Response {
  Map<String, dynamic> json() {
    try {
      return jsonDecode(body) as Map<String, dynamic>;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        NewsApiMalformedResponse(error: error),
        stackTrace,
      );
    }
  }
}
