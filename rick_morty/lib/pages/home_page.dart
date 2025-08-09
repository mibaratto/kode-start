import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_component.dart';
import 'package:rick_morty/components/character_card.dart';
import 'package:rick_morty/data/repository.dart';
import 'package:rick_morty/models/paginated_characters.dart';
import 'package:rick_morty/pages/details_page.dart';
import 'package:rick_morty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PaginatedCharacters>? characters;

  @override
  initState() {
    characters = Repository.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: characters,
        builder: (context, AsyncSnapshot<PaginatedCharacters> snapshot) {
          if (snapshot.hasData) {
            print("snapshot.hasData");
            final dataResults = snapshot.data!.results;
            print(dataResults);
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: dataResults[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      DetailsPage.routeId,
                      arguments: dataResults[index].id,
                    );
                  },
                );
              },
              itemCount: dataResults.length,
            );
          } else if (snapshot.hasError) {
            print("snapshot.hasError");
            print('Ocorreu um erro: $snapshot');
            print('$snapshot.error.toString()');
            return Center(
              child: Text(
                // "Ocorreu um erro.",
                snapshot.error.toString(),
                style: TextStyle(color: AppColors.white),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
