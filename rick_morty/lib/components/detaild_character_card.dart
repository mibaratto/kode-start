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
    var iconColor = character.status == 'Alive' ? Colors.green : Colors.red;

    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              character.image,
              width: double.infinity, // ocupa toda a largura do card
              fit: BoxFit.cover,
              height: 260,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
                bottom: 43,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.5,
                    ),
                  ),
                  const SizedBox(height: 38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 4),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.5,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ), // Contorno preto com largura 2.0
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Icon(Icons.circle, size: 8, color: iconColor),
                        ),
                      ),
                      Text(
                        ' ${character.status} - ${character.species} - ${character.gender}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.5,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Origin:',
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    character.origin,
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Last known location:',
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    character.location,
                    style: TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'First seen in:',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    '$episodeName',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
