import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty/models/detailed_character.dart';

void main() {
  group('DetailedCharacter', () {
    test('fromJson should correctly parse a JSON map', () {
      // givem
      final Map<String, dynamic> characterJson = {
        "id": 1,
        "name": "Rick Sanchez",
        "status": "Alive",
        "species": "Human",
        "gender": "Male",
        "origin": {
          "name": "Earth (C-137)",
          "url": "https://rickandmortyapi.com/api/location/1",
        },
        "location": {
          "name": "Citadel of Ricks",
          "url": "https://rickandmortyapi.com/api/location/3",
        },
        "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        "episode": [
          "https://rickandmortyapi.com/api/episode/1",
          "https://rickandmortyapi.com/api/episode/2",
        ],
      };

      // when
      final DetailedCharacter detailedCharacter = DetailedCharacter.fromJson(
        characterJson,
      );

      // then
      expect(detailedCharacter.id, 1);
      expect(detailedCharacter.name, "Rick Sanchez");
      expect(detailedCharacter.status, "Alive");
      expect(detailedCharacter.species, "Human");
      expect(detailedCharacter.gender, "Male");
      expect(detailedCharacter.origin, "Earth (C-137)");
      expect(detailedCharacter.location, "Citadel of Ricks");
      expect(
        detailedCharacter.image,
        "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      );
      expect(
        detailedCharacter.episodePath,
        "https://rickandmortyapi.com/api/episode/1",
      );
    });

    test('fromJson should throw an exception if a key is missing', () {
      // given
      final Map<String, dynamic> invalidJson = {
        "id": 1,
        "status": "Alive",
        "species": "Human",
        "gender": "Male",
      };

      // Verificar se lança uma exceção
      expect(
        () => DetailedCharacter.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
