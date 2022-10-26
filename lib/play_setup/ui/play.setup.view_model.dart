import 'package:bibletiles/domain/models/bible.tile.category.dart';
import 'package:bibletiles/domain/models/bible.tiles.player.dart';

abstract class PlaySetupViewModel {
  GameLevel get level;

  int get levelIndex;


  int get categoryLimit;

  List<BibleTileCategory> get availableCategories;

  List<BibleTileCategory> get selectedCategories;

  List<BibleTilePlayer> get players;

  GameType get gameType;
  List<String> get playerAvatars;
  List<String> get namesSuggestions;


  SetUpStage get setupStage;

  void setLevel(double level);

  void searchCategories(String query);

  void selectCategory(BibleTileCategory category);

  void unselectCategory(BibleTileCategory category);

  // the game setup is split in sections and once each is done one can go to next settings to change them.
  void nextStage();

  void previousStage();

  void beginPlay();

  void addPlayer(BibleTilePlayer player);

  void removePlayer(BibleTilePlayer player);
  void autoSelectCategories();


   String suggestName();
  void selectGameType(GameType type);
}

enum SetUpStage {typeSetup,levelSetup, categoriesSetup, playersSetup }

enum GameLevel { easy, medium, hard }


enum GameType{
  teams,
  single
}