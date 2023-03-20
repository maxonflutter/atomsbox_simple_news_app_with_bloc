class NewsApiMalformedResponse implements Exception {
  const NewsApiMalformedResponse({required this.error});

  /// The associated error.
  final Object error;
}

/// An exception thrown when an http request failure occurs.
class NewsApiRequestFailure implements Exception {
  const NewsApiRequestFailure({
    required this.statusCode,
    required this.body,
  });

  /// The associated http status code.
  final int statusCode;

  /// The associated response body.
  final Map<String, dynamic> body;
}
