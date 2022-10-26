import 'package:bibletiles/domain/models/bible.tile.dart';

 class BibleTilePlayer {
  final String name;
  final String image;

  // the number of points this player currently has
  final int points;

  // A list containing IDs of the attempted questions by this player
  final List<int> attemptedQuestions;

  const BibleTilePlayer(
      {required this.name,
        required this.image,
        required this.points,
        required this.attemptedQuestions});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BibleTilePlayer &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          points == other.points &&
          attemptedQuestions == other.attemptedQuestions;

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ points.hashCode ^ attemptedQuestions.hashCode;

  BibleTilePlayer copyWith({
    String? name,
    String? image,
    int? points,
    List<int>? attemptedQuestions,
  }) {
    return BibleTilePlayer(
      name: name ?? this.name,
      image: image ?? this.image,
      points: points ?? this.points,
      attemptedQuestions: attemptedQuestions ?? this.attemptedQuestions,
    );
  }
}
