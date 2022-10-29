
import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';

abstract class PlayGameViewModel {







  List<String> get playerAvatars;

  List<String> get namesSuggestions;

  /// limits
  int get categoryLimit;
  int get playersLimit;
  int get minimumCategories;
  int get minimumPlayers;

  List<TilesCategory> get availableCategories;

  List<TilesCategory> get selectedCategories;

  List<Player> get players;

  GameMode get gameType;

  SetUpStage get setupStage;

  GameLevel get level;


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
}




