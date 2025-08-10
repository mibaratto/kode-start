class DetailedCharacter {
  DetailedCharacter({
    required this.image,
    required this.id,
    required this.status,
    required this.name,
    required this.species,
    required this.origin,
    required this.episodePath,
    required this.location,
    required this.gender,
  });

  final String image;
  final int id;
  final String status;
  final String name;
  final String species;
  final String origin;
  final String episodePath;
  final String location;
  final String gender;

  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    return DetailedCharacter(
      image: json['image'],
      id: json['id'],
      status: json['status'],
      name: json['name'],
      species: json['species'],
      origin: json['origin']['name'],
      episodePath: json['episode'][0] as String,
      location: json['location']['name'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'id': id,
      'status': status,
      'name': name,
      'species': species,
      'origin': origin,
      'location': location,
      'episodePath': episodePath,
      'gender': gender,
    };
  }
}
