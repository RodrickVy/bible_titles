import 'package:bibletiles/domain/models/tile.question.dart';

/// A stand alone representation of a question , relating to a subject in scripture.
abstract class BibleTile {
  final int points;
  final TileQuestion easy;
  final TileQuestion medium;
  final TileQuestion hard;
 
  const BibleTile({required this.points, required this.easy, required this.medium, required this.hard});
}

