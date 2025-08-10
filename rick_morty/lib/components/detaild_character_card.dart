import 'package:flutter/material.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({required this.detailedCharacter, Key? key})
    : super(key: key);

  final DetailedCharacter detailedCharacter;

  @override
  Widget build(BuildContext context) {
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
            detailedCharacter.image,
            width: double.infinity, // ocupa toda a largura do card
            // height: 200, // altura fixa (ajuste conforme necessário)
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
                  "name: ${detailedCharacter.name.toUpperCase()}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                  ),
                ),
                const SizedBox(height: 15),
                // Wrap(
                //   spacing: 10,
                //   runSpacing: 10,
                //   children: detailedCharacter.genres
                //       .map(
                //         (genre) => Chip(
                //           backgroundColor: AppColors.primaryColorLight,
                //           labelStyle: TextStyle(color: AppColors.white),
                //           side: BorderSide(color: AppColors.white),
                //           label: Text(genre.name),
                //         ),
                //       )
                //       .toList(),
                // ),
                const SizedBox(height: 15),
                Text(
                  detailedCharacter.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.5,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Production Companies:',
                  style: TextStyle(fontSize: 12.5, color: AppColors.white),
                ),
                // Text(
                //   allCompanies,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 12.5,
                //     color: AppColors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
