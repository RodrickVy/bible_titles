import 'package:bibletiles/domain/models/game/a.play.dart';
import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';
import 'package:get/get.dart';

abstract class PlayGameViewModel {
   RxInt get countDownClock;

   
   int get selectionCountDownTime;
   
   int get answeringCountDownTime;


  List<String> get playerAvatars;
  List<int> get tilesOpened;
  List<String> get namesSuggestions;
 Player? get currentPlayer;
  /// limits
  int get categoryLimit;

  /// how many tiles in each category for a game
  int get tilesNumber;
  
  int get playersLimit;

  int get minimumCategories;

  int get minimumPlayers;

  List<TilesCategory> get availableCategories;

  List<TilesCategory> get selectedCategories;

  List<Player> get players;

  GameMode get gameType;

  SetUpStage get setupStage;

  GameLevel get level;
  
   Tile? get selectedTile;

   bool get isATileSelected;
  void setLevel(GameLevel level);

  void searchCategories(String query);

  void selectCategory(TilesCategory category);

  void unselectCategory(TilesCategory category);

  // the game setup is split in sections and once each is done one can go to next settings to change them.
  void nextStage();

  void previousStage();

  void beginPlay();

  void addPlayer(Player player);

  void removePlayer(Player player);

  void autoSelectCategories();

  String suggestName();

  void selectGameType(GameMode type);

  bool isTileOpen(Tile tile);

  void openTile(Player player, Tile tile);





   void startCountDown({required int start,  int end = 0,required bool Function() endIf, required Function(int countValue) onCountDownEnd});

}
