import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tile.question.dart';

class TilesCategory {

  final String name;

  // the themes this category encompasses mostly used as keywords for filtering
  final List<String> themes;

  // main image of the category
  final String image;
  final String description;

  // the tiles
  final List<Tile> tiles;

  const TilesCategory(
      {required this.name, required this.themes, required this.image, required this.description, required this.tiles});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TilesCategory &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              themes == other.themes &&
              image == other.image &&
              description == other.description &&
              tiles == other.tiles;

  @override
  int get hashCode => name.hashCode ^ themes.hashCode ^ image.hashCode ^ description.hashCode ^ tiles.hashCode;


  List<TileQuestion> get easyQuestions => tiles.map((e) => e.easy).toList();

  List<TileQuestion> get mediumQuestions => tiles.map((e) => e.medium).toList();

  List<TileQuestion> get hardQuestions => tiles.map((e) => e.hard).toList();

  List<TileQuestion>  questionsByLevel(GameLevel level) {
    switch (level) {
      case GameLevel.easy:
        return easyQuestions;
      case GameLevel.medium:
        return mediumQuestions;
      case GameLevel.hard:
        return hardQuestions;
    }
  }
}