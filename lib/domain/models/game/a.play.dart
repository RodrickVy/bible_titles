import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/tile.dart';

class APlay {
  final GameLevel level;
  final Player player;
  final Tile tile;

  final int added;
  final int subtracted;
  late int _timeOpened;
  final int? timeAnswered;
  final Function(Player player) onPlayerUpdate;

  APlay({required this.level,
    this.timeAnswered,
    required this.player,
    required this.tile,
    this.added = 0,
    required this.onPlayerUpdate,
    this.subtracted = 0}) {
    _timeOpened = DateTime
        .now()
        .millisecondsSinceEpoch;
  }


  int get timeOpened => _timeOpened;

  bool get hasAnswered => timeAnswered != null;



  APlay answerQuestion(bool answerIsRight) {
    int timeStamp = DateTime
        .now()
        .millisecondsSinceEpoch;
    if (answerIsRight) {
      return copyWith( added: tile.points, timeAnswered: timeStamp, player: player.copyWith(
        points: tile.points + player.points,
        attemptedTiles: [...player.attemptedTiles, tile.id],
      ));
    }else{
      return copyWith( subtracted: tile.points, timeAnswered: timeStamp, player: player.copyWith(
        points: tile.points - player.points,
        attemptedTiles: [...player.attemptedTiles, tile.id],
      ));
    }
  }

  APlay copyWith({
    GameLevel? level,
    Player? player,
    Tile? tile,
    int? added,
    int? subtracted,
    int? timeAnswered,
    Function(Player player)? onPlayerUpdate
  }) {
    return APlay(
      level: level ?? this.level,
      player: player ?? this.player,
      tile: tile ?? this.tile,
      added: added ?? this.added,
      subtracted: subtracted ?? this.subtracted,
      timeAnswered: timeAnswered ?? this.timeAnswered,
      onPlayerUpdate: onPlayerUpdate ?? this.onPlayerUpdate,
    );
  }
}
