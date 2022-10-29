

 import 'package:bibletiles/domain/models/game/tile.dart';

class Player {
  final String name;
  final String image;

  // the number of points this player currently has
  final int points;

  // A list containing IDs of the attempted questions by this player
  final List<int> attemptedTiles;
 

  const Player(
      {required this.name,
        required this.image,
        required this.points,
        required this.attemptedTiles});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          points == other.points &&
          attemptedTiles == other.attemptedTiles;

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ points.hashCode ^ attemptedTiles.hashCode;

  Player copyWith({
    String? name,
    String? image,
    int? points,
    List<int>? attemptedTiles,
  }) {
    return Player(
      name: name ?? this.name,
      image: image ?? this.image,
      points: points ?? this.points,
      attemptedTiles: attemptedTiles ?? this.attemptedTiles,
    );
  }
  
  

  int get id => name.hashCode;
}
