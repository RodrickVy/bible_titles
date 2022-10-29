import 'dart:math';

import 'package:bibletiles/domain/models/game/a.play.dart';
import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';
import 'package:bibletiles/play_setup/controller/repo.dart';

import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:get/get.dart';

class PlaySetupController extends GetxController with GameMetaData {
  static List<TilesCategory> get allCategories => GameMetaData.categories;

  final RxMap<int,Player> _players = <int,Player>{}.obs;


  final Rx<APlay?> _currentPlay = Rx<APlay?>(null);



  final RxList<int> _tilesOpened = RxList();
  
  
  
  
  /// RXs
  void openTile(Player player,Tile tile){
    _currentPlay(APlay(level: level, player: player, tile: tile, onPlayerUpdate:(player){
      _players[player.id] = player;
    }));
  }

  void answerATile(String answer){
    _currentPlay(_currentPlay.value?.answerQuestion(answer));
  }
  
  
  final Rx<GameMode> _gameType = GameMode.teams.obs;
  final Rx<GameLevel> _level = GameLevel.easy.obs;

  final RxList<TilesCategory> _selectedCategories = <TilesCategory>[].obs;
  final RxList<TilesCategory> _availableCategories = allCategories.obs;

  @override
  GameMode get gameType => _gameType.value;

  @override
  GameLevel get level => _level.value;

  @override
  List<Player> get players => _players.values.toList();

  @override
  List<TilesCategory> get availableCategories => _availableCategories;

  @override
  List<TilesCategory> get selectedCategories => _selectedCategories;

  @override
  SetUpStage get setupStage {
    return SetUpStage.values.byName(Get.parameters['stage'] ?? SetUpStage.values.first.name);
  }

  @override
  String suggestName() {
    final List<String> suggestions = namesSuggestions;
    suggestions.shuffle();
    return suggestions.first;
  }

  @override
  void setLevel(GameLevel level) {
    _level(level);
  }

  @override
  void beginPlay() {
    Get.toNamed('/play');
  }

  @override
  void nextStage() {
    switch (setupStage) {
      case SetUpStage.typeSetup:
        Get.toNamed('/setup/${SetUpStage.levelSetup.name}');
        break;
      case SetUpStage.levelSetup:
        Get.toNamed('/setup/${SetUpStage.categoriesSetup.name}');
        break;
      case SetUpStage.categoriesSetup:
        Get.toNamed('/setup/${SetUpStage.playersSetup.name}');
        break;
      case SetUpStage.playersSetup:
        Get.toNamed('/play');
        break;
    }
  }

  @override
  void previousStage() {
    switch (setupStage) {
      case SetUpStage.typeSetup:
        Get.toNamed('/setup/${SetUpStage.levelSetup.name}');
        break;
      case SetUpStage.levelSetup:
        Get.toNamed('/setup/${SetUpStage.typeSetup.name}');
        break;
      case SetUpStage.categoriesSetup:
        Get.toNamed('/setup/${SetUpStage.levelSetup.name}');
        break;
      case SetUpStage.playersSetup:
        Get.toNamed('/setup/${SetUpStage.categoriesSetup.name}');
        break;
    }
  }

  @override
  void searchCategories(String query) {
    final String sanitizedQuery = _sanitizeForSearch(query);

    if (sanitizedQuery.isEmpty) {
      _availableCategories(allCategories);
    } else {
      List<TilesCategory> searchResults = allCategories.where((element) {
        return _sanitizeForSearch(element.name).contains(sanitizedQuery) ||
            _sanitizeForSearch(element.description).contains(sanitizedQuery) ||
            element.themes.map((e) => _sanitizeForSearch(e)).contains(sanitizedQuery) ||
            element.tiles.any((element) =>
                element.easy.question.contains(sanitizedQuery) ||
                element.medium.question.contains(sanitizedQuery) ||
                element.hard.question.contains(sanitizedQuery));
      }).toList();
      _availableCategories(searchResults);
    }
  }

  String _sanitizeForSearch(String word) {
    return word.trim().toLowerCase();
  }

  @override
  void selectCategory(TilesCategory category) {

      if (!_selectedCategories.contains(category) && _selectedCategories.length < categoryLimit) {
        _selectedCategories.add(category);
      } else {
        _selectedCategories.remove(category);
      }


  }

  @override
  void autoSelectCategories() {
    List<TilesCategory> categories = [...allCategories];

    categories.shuffle();

    if (categories.length > categoryLimit) {
      _selectedCategories.addAll(categories.sublist(0, categoryLimit - _selectedCategories.length));
    } else {
      _selectedCategories(categories);
    }
  }

  @override
  void unselectCategory(TilesCategory category) {
    final categories = _selectedCategories;
    categories.remove(category);

    _selectedCategories.addAll(categories);
  }

  @override
  void addPlayer(Player player) {
    _players[player.id] = player;
  }

  @override
  void removePlayer(Player player) {
    _players.remove(player);
  }

  @override
  void selectGameType(GameMode type) {
    _gameType(type);
  }
}
