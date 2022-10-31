import 'dart:async';
import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';
import 'package:bibletiles/play/controller/repo.dart';

import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:get/get.dart';

class PlaySetupController extends GetxController with GameMetaData implements PlayGameViewModel {
  static List<TilesCategory> get allCategories => GameMetaData.categories;

  ///TILE

  /// set when the current player selected a tile, is set to null after each player  turn is finished.
  final Rx<Tile?> _selectedTile = Rx<Tile?>(null);

  @override
  Tile? get selectedTile => _selectedTile.value;

  @override
  bool get isATileSelected => _selectedTile.value != null;

  ///PLAYERS

  /// allows us to keep track and update players in a game, this is where players are initially set in setup time
  /// and where their points are updated, its the source of truth for each [Player] state in the game.
  final RxMap<int, Player> players = <int, Player>{
    // 100: Player(name: "The Jims", image: 'image', points: 0, attemptedTiles: []),
    // 200: Player(name: "Catalyst", image: 'image', points: 0, attemptedTiles: []),
    // 300: Player(name: "Owners", image: 'image', points: 0, attemptedTiles: []),
  }.obs;

  /// transformation of players, for easy looping

  /// the player who's turn it is to play.
  final RxInt _currentPlayer = RxInt(0);

  @override
  Player get currentPlayer => players.values.toList()[_currentPlayer.value];

  
  /// called when the user has selected a tile for the player
  __playerSelectedATile(int points){
    players[_currentPlayer.value] = currentPlayer.copyWith(
        points: points,
        attemptedTiles: [...currentPlayer.attemptedTiles,selectedTile!.id]
    );
  }
  /// updates the current player to the next inline selecting player 0 if we are on the last.
  /// It first checks to see if some tiles haven't been attempted.
  /// Then also begins a selection-countdown for the player.
  void __nextPlayer() {
    if (!allTilesAttempted) {
      int currentPlayerIndex = players.values.toList().indexOf(currentPlayer);

      if (currentPlayerIndex < players.length - 1) {
        _currentPlayer(players.values.toList()[currentPlayerIndex+ 1].id);
      } else {
        _currentPlayer(players.values.first.id);
      }

      /// After updating the player , we begin a selection countdown
      /// This is the time the user has to select a tile for a player if they dont in this time allotted ,
      /// the player will loose points and the countdown we automatically restart  again.
      /// After the second countdown is done before user  selects players tile the player will be skipped.
      startCountDown(
        start: selectionCountDownTime,
        // if the player has selected a tile, then end count down.
        endIf: () => isATileSelected,
        onCountDownEnd: (int secondsLeft) {
          // if the player has selected a tile, update [Player] points based on speed of selection as well as their attemptedTiles
          if (isATileSelected) {
            /// the player is given the seconds left as bonus points for speed
            __playerSelectedATile(secondsLeft);
          }else{
            // else minus the player some points and restart the counter 1 more time
            startCountDown(
              start: selectionCountDownTime,
              endIf: ()=>isATileSelected, 
              onCountDownEnd: (int extraSecondsLeft) {
                if (isATileSelected) {
                  /// since this is second count down the player is minimized the extra points it took them to select a tile 
                  __playerSelectedATile(selectionCountDownTime - extraSecondsLeft);
                }else{
                  /// if player has nothing selected by now, they are skipped
                  __nextPlayer();
                }
              },
              
            );
          }
        },
      );
    } else {
      //  todo end game
    }
  }

  /// skips to the specified player , option can be used if player is not around.
  void skipPlayerTo(int player) {
    if (player < players.length) {
      _currentPlayer(player);
    }
  }


  /// whether all tiles in the current game have been opened , signalling the end of the game.
  ///
  bool get allTilesAttempted => _tilesOpened.length == categoryLimit * tilesNumber;

  final RxList<int> _tilesOpened = RxList();

  @override
  List<int> get tilesOpened => _tilesOpened;


  // COUNT DOWN
  @override
  final RxInt countDownClock = 60.obs;

  ///CountDown is a clock that can be called in to count down at any time, this function is not for a specific method,
  /// this is the allotted time for the player to open a tile.
  /// [endIf] is a condition that can be checked everytime countdown and is able to end the countdown before it reaches the given [end].
  /// [onCountDownEnd] is called when the counter ends, weather naturally or the [endIf] condition has been satisfied ,
  /// [onCountDownEnd] gives you the countValue when the condition was satisfied.
  @override
  void startCountDown(
      {required int start,
      int end = 0,
      required bool Function() endIf,
      required Function(int countValue) onCountDownEnd}) {
    countDownClock(start);
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (endIf()) {
        timer.cancel();
        onCountDownEnd(countDownClock.value);
      }
      if (countDownClock.value > end) {
        countDownClock.value--;
      } else {
        onCountDownEnd(countDownClock.value);
        timer.cancel();
      }
    });
  }

  final Rx<GameMode> _gameType = GameMode.timed.obs;

  @override
  GameMode get gameType => _gameType.value;

  final Rx<GameLevel> _level = GameLevel.easy.obs;

  @override
  GameLevel get level => _level.value;

  final RxList<TilesCategory> _selectedCategories = allCategories.obs;

  @override
  List<TilesCategory> get selectedCategories => _selectedCategories;

  final RxList<TilesCategory> _availableCategories = allCategories.obs;

  @override
  List<TilesCategory> get availableCategories => _availableCategories;

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
            element.tiles.values.any((element) => element.any((e) {
                  return e.explanation.contains(sanitizedQuery) ||
                      e.question.contains(sanitizedQuery) ||
                      e.answer.contains(sanitizedQuery);
                }));
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
    players[player.id] = player;
  }

  @override
  void removePlayer(Player player) {
    players.remove(player);
  }

  @override
  void selectGameType(GameMode type) {
    _gameType(type);
  }


}
