

import 'package:bibletiles/domain/models/tour/tour.segment.dart';
import 'package:bibletiles/tour/interface/tour.view_model.dart';
import 'package:get/get.dart';

class TourController extends GetxController implements TourViewModel {
  @override

  List<TourSegment> get segments {
    return [
      TourSegment(image: 'assets/logos/icon.png', title: 'Its Kinda Like Jeopardy', description: 'A grid of questions in 5 categories, and questions on each category with a different point from least point to greatest points.'),
      TourSegment(image:  'assets/logos/icon.png', title: 'title', description: 'The teams take turns to answer the questions, and can choose a category and amount of points , when they get the question right they get the point otherwise they lose the points. '),
      TourSegment(image:  'assets/logos/icon.png', title: 'title', description: "Once a question has been selected it can't be chosen again, the objective of the game is to be the player with the most points after all the questions are done. "),
    ];
  }
  final RxInt _currentSegment = 0.obs;
  @override
  int get currentSegment => _currentSegment.value;

  @override
  void nextSegment() {
     if(_currentSegment.value < segments.length-1){
       _currentSegment(_currentSegment.value+1);
     }else{
       skipTour();
     }
  }

  @override
  void previousSegment() {
   if(_currentSegment.value > 0){
     _currentSegment(_currentSegment.value-1);
   }
  }



  @override
  void skipTour() {
    Get.toNamed('/setup');
  }



}