
import 'package:bibletiles/domain/models/bible.tile.dart';

class BibleTileCategory {

  final String name;
  // the themes this category encompasses mostly used as keywords for filtering
  final List<String> themes;
  // main image of the category
  final String image;
  final String description;

  // the tiles
  final List<BibleTile> tiles;

  const BibleTileCategory({required this.name, required this.themes, required this.image, required this.description, required this.tiles});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BibleTileCategory &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          themes == other.themes &&
          image == other.image &&
          description == other.description &&
          tiles == other.tiles;

  @override
  int get hashCode => name.hashCode ^ themes.hashCode ^ image.hashCode ^ description.hashCode ^ tiles.hashCode;
}