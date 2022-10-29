import 'package:bibletiles/domain/models/game/level.dart';

/// A stand alone representation of a question , relating to a subject in scripture.
 class Tile {
   final String image;

   final String question;
   final String answer;
   final String explanation;
   final GameLevel level;
   final int points;

 
  const Tile( {this.points = 0,  required this.question, required this.answer, required this.explanation, this.level = GameLevel.easy,required this.image, });


   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tile &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          question == other.question &&
          answer == other.answer &&
          explanation == other.explanation &&
          level == other.level;

  @override
  int get hashCode => points.hashCode ^ image.hashCode ^ question.hashCode ^ answer.hashCode ^ explanation.hashCode ^ level.hashCode;

  int get id => hashCode;

   Tile copyWith({
    String? image,
    String? question,
    String? answer,
    String? explanation,
    GameLevel? level,
    int? points,
  }) {
    return Tile(
      image: image ?? this.image,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      explanation: explanation ?? this.explanation,
      level: level ?? this.level,
      points: points ?? this.points,
    );
  }
}

