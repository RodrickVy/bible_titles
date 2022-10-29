import 'package:bibletiles/domain/models/game/tile.question.dart';

/// A stand alone representation of a question , relating to a subject in scripture.
 class Tile {
  final int points;
  final TileQuestion easy;
  final TileQuestion medium;
  final TileQuestion hard;
 
  const Tile({required this.points, required this.easy, required this.medium, required this.hard});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tile &&
          runtimeType == other.runtimeType &&
          points == other.points &&
          easy == other.easy &&
          medium == other.medium &&
          hard == other.hard;

  @override
  int get hashCode => points.hashCode ^ easy.hashCode ^ medium.hashCode ^ hard.hashCode;





  int get id => hashCode;
  Tile copyWith({
    int? points,
    TileQuestion? easy,
    TileQuestion? medium,
    TileQuestion? hard,
  }) {
    return Tile(
      points: points ?? this.points,
      easy: easy ?? this.easy,
      medium: medium ?? this.medium,
      hard: hard ?? this.hard,
    );
  }
}

