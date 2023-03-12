// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      headline: json['headline'] as String,
      leadParagraph: json['leadParagraph'] as String,
      supportingParagraph: (json['supportingParagraph'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
      category: $enumDecodeNullable(_$NewsCategoryEnumMap, json['category']),
      isBreakingNews: json['isBreakingNews'] as bool? ?? false,
      isPopular: json['isPopular'] as bool? ?? false,
    );

const _$NewsCategoryEnumMap = {
  NewsCategory.economy: 'economy',
  NewsCategory.politics: 'politics',
  NewsCategory.entertainment: 'entertainment',
  NewsCategory.sport: 'sport',
};
