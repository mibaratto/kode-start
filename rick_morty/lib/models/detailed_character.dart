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

  factory DetailedCharacter.fromJson(Map<String, dynamic> characterData) {
    return DetailedCharacter(
      image: characterData['image'],
      id: characterData['id'],
      status: characterData['status'],
      name: characterData['name'],
      species: characterData['species'],
      origin: characterData['origin']['name'],
      episodePath: characterData['episode'][0] as String,
      location: characterData['location']['name'],
      gender: characterData['gender'],
    );
  }
}
