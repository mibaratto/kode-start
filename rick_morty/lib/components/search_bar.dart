import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CharacterSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const CharacterSearchBar({required this.onSearch, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Busque um personagem pelo nome',
          hintStyle: TextStyle(fontSize: 16.0, color: AppColors.whiteOff),
          prefixIcon: Icon(Icons.search, color: AppColors.whiteOff),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}
