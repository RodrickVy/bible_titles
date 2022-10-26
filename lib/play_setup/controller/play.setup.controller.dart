import 'package:bibletiles/domain/models/bible.tile.category.dart';
import 'package:bibletiles/domain/models/bible.tiles.player.dart';
import 'package:bibletiles/play_setup/controller/repo.dart';
import 'package:bibletiles/play_setup/ui/play.setup.view_model.dart';
import 'package:get/get.dart';

class PlaySetupController extends GetxController implements PlaySetupViewModel {

  @override
  List<String> get namesSuggestions => suggestedProfiles.map((e) => e.name).toList();

  @override
  List<String> get playerAvatars =>  suggestedProfiles.map((e) => e.avatar).toList();


  final Rx<GameType> _gameType = GameType.teams.obs;

  @override
  GameType get gameType =>_gameType.value;


  @override
  int get categoryLimit => 5;

  static List<BibleTileCategory> get allCategories {
    return [
      const BibleTileCategory(
          name: "Isreal's Kings",
          themes: ['kings', "obedience", 'government', 'wars', 'Israel', 'history'],
          image: 'assets/logos/icon.png',
          description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
          tiles: []),
      const BibleTileCategory(
          name: "Joseph",
          themes: ['history'],
          image: 'assets/logos/icon.png',
          description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
          tiles: []),
      const BibleTileCategory(
          name: "Women In Scripture",
          themes: ['history'],
          image: 'assets/logos/icon.png',
          description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
          tiles: []),
      const BibleTileCategory(
          name: "Jesus",
          themes: [],
          image: 'assets/logos/icon.png',
          description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
          tiles: []),
      const BibleTileCategory(
          name: "Angels",
          themes: [],
          image: 'assets/logos/icon.png',
          description: 'A challenging look at the kings of Israel and their reign and Gods hand in dealing with them',
          tiles: [])
    ];
  }

  final RxInt _level = 0.obs;
  final RxList<BibleTilePlayer> _players = <BibleTilePlayer>[].obs;
  final RxList<BibleTileCategory> _selectedCategories = <BibleTileCategory>[].obs;
  final RxList<BibleTileCategory> _availableCategories = allCategories.obs;


  @override
  int get levelIndex => _level.value;

  @override
  GameLevel get level => GameLevel.values[_level.value];

  @override
  List<BibleTilePlayer> get players => _players;

  @override
  List<BibleTileCategory> get availableCategories => _availableCategories;

  @override
  List<BibleTileCategory> get selectedCategories => _selectedCategories;

  @override
  SetUpStage get setupStage {
   return SetUpStage.values.byName(Get.parameters['stage']??SetUpStage.values.first.name);
  }
  @override
  String suggestName(){
    final List<String> suggestions = namesSuggestions;
    suggestions.shuffle();
    return suggestions.first;
  }
  @override
  void setLevel(double level) {
    if (level > 3) {
      _level(3);
    }
    _level(level.toInt());
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
      List<BibleTileCategory> searchResults = allCategories.where((element) {
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
  void selectCategory(BibleTileCategory category) {
    if (!_selectedCategories.contains(category)) {
      _selectedCategories.add(category);
    } else {
      _selectedCategories.remove(category);
    }
  }


  @override
  void autoSelectCategories(){
    final List<BibleTileCategory> categories = allCategories;
    categories.shuffle();
    if(categories.length > categoryLimit){
      _selectedCategories.addAll(categories.sublist(0,categoryLimit - _selectedCategories.length));
    }else{
      _selectedCategories(categories);
    }

  }

  @override
  void unselectCategory(BibleTileCategory category) {
    final categories = _selectedCategories;
    categories.remove(category);

    _selectedCategories.addAll(categories);
  }

  @override
  void addPlayer(BibleTilePlayer player) {
    _players.add(player);
  }

  @override
  void removePlayer(BibleTilePlayer player) {
    _players.remove(player);
  }

  @override
  void selectGameType(GameType type){
    _gameType(type);
  }
}
