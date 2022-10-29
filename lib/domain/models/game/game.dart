import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/tiles.category.dart';

class BibleTilesGame {
  final DateTime began;
  final DateTime ended;
  final List<Player> players;
  final List<TilesCategory> categories;
  final int currentPlayer;

  const BibleTilesGame(
      {required this.began,
      required this.ended,
      required this.players,
      required this.categories,
      required this.currentPlayer});


}
