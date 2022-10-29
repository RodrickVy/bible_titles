import 'dart:collection';

import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/models/game/tile.question.dart';

class TilesCategory {
  final String name;

  // the themes this category encompasses mostly used as keywords for filtering
  final List<String> themes;

  // main image of the category
  final String image;
  final String description;

  // the tiles points,tile
  late SplayTreeMap<int, List<Tile>> tiles;

  TilesCategory(
      {required this.name,
      required this.themes,
      required this.image,
      required this.description,
      required final Map<int, List<Tile>> categoryTiles
      // setting all the points based on keys
      })
      : tiles = SplayTreeMap<int, List<Tile>>.from(setTilePoints(categoryTiles));

  static SplayTreeMap<int, List<Tile>> setTilePoints(Map<int, List<Tile>> categoryTiles) {
    Iterable<MapEntry<int, List<Tile>>> updatedEntries = categoryTiles.entries.map((MapEntry<int, List<Tile>> entry) {
      return MapEntry(entry.key, entry.value.map((e) => e.copyWith(points: entry.key)).toList());
    });

    return  SplayTreeMap<int, List<Tile>>.from({ for (var e in updatedEntries) e.key : e.value });

  }

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

  List<Tile> get generateTiles {
    return tiles.values.map((value) {
      final List<Tile> tiles = value;
      tiles.shuffle();
      return tiles.first;
    }).toList();
  }

  List<Tile> get allTiles{
    return tiles.values.fold([], (previousValue, element) => [...previousValue,...element]);
  }
}
