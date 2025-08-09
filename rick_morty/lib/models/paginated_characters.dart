class PaginatedCharacters {
  PaginatedCharacters({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
    required this.results,
  });
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<Character> results;

  factory PaginatedCharacters.fromJson(Map<String, dynamic> json) {
    return PaginatedCharacters(
      count: json['info']['count'],
      pages: json['info']['pages'],
      next: json['info']['next'],
      prev: json['info']['prev'],
      results: List.from(
        json['results'],
      ).map((e) => Character.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
      'results': results.map((e) => e.toJson()).toList(),
    };
  }
}

class Character {
  Character({required this.image, required this.id, required this.name});

  final String image;
  final int id;
  final String name;

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(image: json['image'], id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'id': id, 'name': name};
  }
}
