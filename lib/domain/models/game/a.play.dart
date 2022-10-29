import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tile.question.dart';

class APlay {
  final GameLevel level;
  final Player player;
  final Tile tile;
  final String answer;
  final int added;
  final int subtracted;
  late int _timeOpened;
  final int? timeAnswered;
  final Function(Player player) onPlayerUpdate;

  APlay({required this.level,
    this.timeAnswered,
    required this.player,
    required this.tile,
    this.answer = '',
    this.added = 0,
    required this.onPlayerUpdate,
    this.subtracted = 0}) {
    _timeOpened = DateTime
        .now()
        .millisecondsSinceEpoch;
  }


  int get timeOpened => _timeOpened;

  bool get hasAnswered => timeAnswered != null;

  TileQuestion get question {
    switch (level) {
      case GameLevel.easy:
        return tile.easy;
      case GameLevel.medium:
        return tile.medium;
      case GameLevel.hard:
        return tile.hard;
    }
  }

  APlay answerQuestion(answer) {
    int timeStamp = DateTime
        .now()
        .millisecondsSinceEpoch;
    if (answer == question.answer) {
      return copyWith(answer: answer, added: tile.points, timeAnswered: timeStamp, player: player.copyWith(
        points: tile.points + player.points,
        attemptedTiles: [...player.attemptedTiles, tile.id],
      ));
    }
    return copyWith(
        answer: answer, subtracted: tile.points, timeAnswered: timeStamp, player: player.subtractPoints(tile.points));
  }

  APlay copyWith({
    GameLevel? level,
    Player? player,
    Tile? tile,
    String? answer,
    int? added,
    int? subtracted,
    int? timeAnswered,
    Function(Player player)? onPlayerUpdate
  }) {
    return APlay(
      level: level ?? this.level,
      player: player ?? this.player,
      tile: tile ?? this.tile,
      answer: answer ?? this.answer,
      added: added ?? this.added,
      subtracted: subtracted ?? this.subtracted,
      timeAnswered: timeAnswered ?? this.timeAnswered,
      onPlayerUpdate: onPlayerUpdate ?? this.onPlayerUpdate,
    );
  }
}
