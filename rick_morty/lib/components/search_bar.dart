import 'package:flutter/material.dart';

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
          hintText: 'Buscar por nome',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}
