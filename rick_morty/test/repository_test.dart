// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:http_mock_adapter/http_mock_adapter.dart';
// import 'package:rick_morty/data/repository.dart';
// import 'package:rick_morty/models/detailed_character.dart';
// import 'package:rick_morty/models/paginated_characters.dart';
// import 'package:test/test.dart';

// void main() async {
//   final dio = Dio();
//   final dioAdapter = DioAdapter(dio: dio);
//   dio.httpClientAdapter = dioAdapter;

//   group('Test Repository', () {
//     test('getCharacters returns PaginatedCharacters', () async {
//       // given
//       String path = '/character?page=1';
//       String apiData = """
//         {
//           "info": {
//             "count": 826,
//             "pages": 42,
//             "next": "https://rickandmortyapi.com/api/character/?page=2",
//             "prev": null
//           },
//           "results": [
//             {
//               "id": 1,
//               "name": "Aqua Morty",
//               "status": "unknown",
//               "species": "Humanoid",
//               "type": "Fish-Person",
//               "gender": "Male",
//               "origin": { "name": "unknown", "url": "" },
//               "location": { "name": "Citadel of Ricks", "url": "https://rickandmortyapi.com/api/location/3" },
//               "image": "https://rickandmortyapi.com/api/character/avatar/21.jpeg",
//               "episode": [
//                 "https://rickandmortyapi.com/api/episode/10",
//                 "https://rickandmortyapi.com/api/episode/22"
//               ],
//               "url": "https://rickandmortyapi.com/api/character/21",
//               "created": "2017-11-04T22:39:48.055Z"
//             }
//           ]
//         }
//         """;

//       dioAdapter.onGet(
//         path,
//         (request) => request.reply(200, jsonDecode(apiData)),
//       );

//       // when
//       final response = await Repository.getCharacters(page: 1);

//       // then
//       final expectedCharacter = DetailedCharacter(
//         id: 1,
//         name: "Aqua Morty",
//         status: "unknown",
//         image: "https://rickandmortyapi.com/api/character/avatar/21.jpeg",
//         species: "Humanoid",
//         origin: "unknown",
//         episodePath: "https://rickandmortyapi.com/api/episode/10",
//         location: "Citadel of Ricks",
//         gender: "Male",
//       );
//       final charactersList = [expectedCharacter];
//       final expectedResponse = PaginatedCharacters(
//         count: 826,
//         pages: 42,
//         next: "https://rickandmortyapi.com/api/character/?page=2",
//         prev: null,
//         charactersList: charactersList,
//       );

//       expect(response.count, expectedResponse.count);
//       expect(response.charactersList.first.name, expectedCharacter.name);
//     });
//   });

  // const path = 'https://example.com';

  // dioAdapter.onGet(path, (request) => request.reply(200, {'banana': 'Sim!'}));

  // final response = await dio.get(path);

  // print(response.data); // {message: Success!}
// }
