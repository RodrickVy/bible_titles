import 'package:bibletiles/domain/models/tour/tour.segment.dart';

abstract class TourViewModel{

   List<TourSegment> get segments;

   int get currentSegment;


   void nextSegment();

   void previousSegment();

   void skipTour();

}