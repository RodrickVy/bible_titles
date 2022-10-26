import 'package:bibletiles/tour/model/tour.segment.dart';

abstract class TourViewModel{

   List<TourSegment> get segments;

   int get currentSegment;


   void nextSegment();

   void previousSegment();

   void skipTour();

}