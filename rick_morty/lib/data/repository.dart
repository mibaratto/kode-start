import 'package:dio/dio.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(baseUrl: "https://rickandmortyapi.com/api"),
  );

  static Future<PaginatedCharacters> getCharacters({int page = 1}) async {
    var response = await _dio.get("/character?page=$page");
    return PaginatedCharacters.fromJson(response.data);
  }

  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    var response = await _dio.get("/character/$characterId");
    return DetailedCharacter.fromJson(response.data);
  }
}
