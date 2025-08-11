import 'package:rick_morty/models/detailed_character.dart';

class PaginatedCharacters {
  PaginatedCharacters({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
    required this.charactersList,
  });
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<DetailedCharacter> charactersList;

  factory PaginatedCharacters.fromJson(Map<String, dynamic> apiData) {
    return PaginatedCharacters(
      count: apiData['info']['count'],
      pages: apiData['info']['pages'],
      next: apiData['info']['next'],
      prev: apiData['info']['prev'],
      charactersList: List.from(
        apiData['results'],
      ).map((e) => DetailedCharacter.fromJson(e)).toList(),
    );
  }
}
