import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_component.dart';
import 'package:rick_morty/components/detaild_character_card.dart';
import 'package:rick_morty/data/repository.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/theme/app_colors.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';
  const DetailsPage({required this.characterId, Key? key}) : super(key: key);

  final int characterId;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<DetailedCharacter>? detailedMovie;

  @override
  initState() {
    detailedMovie = Repository.getCharacterDetails(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: detailedMovie,
        builder: (context, AsyncSnapshot<DetailedCharacter> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: [DetailedCharacterCard(detailedCharacter: data)],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Ocorreu um erro.",
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
