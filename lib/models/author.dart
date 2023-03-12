import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  const Author({
    required this.id,
    required this.name,
    required this.surname,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  final String id;
  final String name;
  final String surname;

  static const empty = Author(
    id: '',
    name: '',
    surname: '',
  );
}
