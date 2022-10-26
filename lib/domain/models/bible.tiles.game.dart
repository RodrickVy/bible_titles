import 'package:bibletiles/domain/models/bible.tile.category.dart';
import 'package:bibletiles/domain/models/bible.tiles.player.dart';

class BibleTilesGame {
  final DateTime began;
  final DateTime ended;
  final List<BibleTilePlayer> players;
  final List<BibleTileCategory> categories;
  final int currentPlayer;

  const BibleTilesGame(
      {required this.began,
      required this.ended,
      required this.players,
      required this.categories,
      required this.currentPlayer});


}
