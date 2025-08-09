import 'package:flutter/material.dart';
import 'package:rick_morty/models/paginated_characters.dart';
import 'package:rick_morty/theme/app_colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, required this.onTap, Key? key})
    : super(key: key);

  final Character character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              character.image,
              // "https://image.tmdb.org/t/p/w1000_and_h450_multi_faces${character.backdropPath}",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "name: ${character.name.toUpperCase()}",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
