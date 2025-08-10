import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/theme/app_colors.dart';
import 'package:dio/dio.dart';

class DetailedCharacterCard extends StatefulWidget {
  const DetailedCharacterCard({required this.detailedCharacter, Key? key})
    : super(key: key);

  final DetailedCharacter detailedCharacter;

  @override
  State<DetailedCharacterCard> createState() => _DetailedCharacterCardState();
}

class _DetailedCharacterCardState extends State<DetailedCharacterCard> {
  String? episodeName;

  @override
  void initState() {
    super.initState();
    fetchEpisodeName();
  }

  Future<void> fetchEpisodeName() async {
    try {
      final response = await Dio().get(widget.detailedCharacter.episodePath);
      setState(() {
        episodeName = response.data['name'];
      });
    } catch (e) {
      setState(() {
        episodeName = 'Erro ao carregar episódio';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final character = widget.detailedCharacter;

    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            character.image,
            width: double.infinity, // ocupa toda a largura do card
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "name: ${character.name.toUpperCase()}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "species: ${character.species.toUpperCase()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "gender: ${character.gender.toUpperCase()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "status: ${character.status.toUpperCase()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "first episode: ${episodeName ?? 'Carregando episódio...'}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
