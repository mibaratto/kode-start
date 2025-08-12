import 'package:flutter/material.dart';
import 'package:rick_morty/components/app_bar_component.dart';
import 'package:rick_morty/components/character_card.dart';
import 'package:rick_morty/components/search_bar.dart';
import 'package:rick_morty/data/repository.dart';
import 'package:rick_morty/models/detailed_character.dart';
import 'package:rick_morty/pages/details_page.dart';
import 'package:rick_morty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DetailedCharacter> characters = [];
  int currentPage = 1;
  bool isLoading = false;
  bool isSearching = false;
  bool isLastPage = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          !isSearching &&
          !isLastPage) {
        fetchCharacters();
      }
    });
  }

  Future<void> fetchCharacters() async {
    setState(() => isLoading = true);
    try {
      final result = await Repository.getCharacters(page: currentPage);
      setState(() {
        characters.addAll(result.charactersList);
        currentPage++;
        isLastPage = result.next == null;
      });
    } catch (e) {
      print('fetchCharacters: ERRO: ${e.toString()}');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> searchCharacters(String name) async {
    setState(() {
      isLoading = true;
      isSearching = true;
    });

    try {
      final result = await Repository.searchCharacters(name);
      setState(() {
        characters = result.charactersList;
        isLastPage = true;
      });
    } catch (e) {
      setState(() {
        characters = [];
        isLastPage = true;
      });
      print('searchCharacters: ERRO: ${e.toString()}');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void clearSearch() {
    setState(() {
      characters.clear();
      currentPage = 1;
      isLastPage = false;
      isSearching = false;
    });
    fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CharacterSearchBar(
            onSearch: (name) {
              if (name.isEmpty) {
                clearSearch();
              } else {
                searchCharacters(name);
              }
            },
          ),
          Expanded(
            child: characters.isEmpty && !isLoading
                ? Center(
                    child: Text(
                      'Nenhum personagem encontrado com este nome.',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: characters.length + (isLoading ? 1 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 7.5),
                    itemBuilder: (context, index) {
                      if (index < characters.length) {
                        return CharacterCard(
                          character: characters[index],
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              DetailsPage.routeId,
                              arguments: characters[index].id,
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
