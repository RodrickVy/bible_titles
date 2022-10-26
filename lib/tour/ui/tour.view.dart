import 'package:bibletiles/domain/models/adaptive.dart';
import 'package:bibletiles/domain/models/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/tour/model/tour.segment.dart';
import 'package:bibletiles/tour/ui/view.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourPage<T extends TourViewModel> extends AView<T> {
  const TourPage({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Scaffold(
      appBar: const BibleTilesAppBar<HomeController>(),
      body: Obx(
        () {
          final TourSegment segment = controller.segments[controller.currentSegment];
          return SizedBox(
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(segment.image),
                ),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  ...controller.segments.map2((e,int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(radius: 5,backgroundColor: index == controller.currentSegment ? Colors.yellow: Colors.grey,),
                  ))
                ],),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextView(text: segment.title,type: HeadingType.headlineMedium,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextView(text: segment.description),
                ),
                if(controller.currentSegment < controller.segments.length-1)
                   Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.skipTour();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: TextView(
                          text: "Skip",
                          type: HeadingType.bodyLarge,
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.previousSegment();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextView(
                          text: "back",
                          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          type: HeadingType.bodyLarge,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.nextSegment();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: TextView(
                          text: "Next",
                          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          type: HeadingType.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                if(controller.currentSegment == controller.segments.length-1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      controller.skipTour();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    child: TextView(
                      text: "Play",
                      type: HeadingType.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
