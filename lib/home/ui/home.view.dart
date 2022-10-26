import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/home/ui/home.view.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeView<T extends HomeViewModel> extends AView<T> {
  const HomeView({super.key});


  static const double buttonSpacing = 20;
  static const double buttonAnimationTravelDistance = 32;
  @override
  Widget builder(BuildContext context, T controller) {
    return Scaffold(
      appBar: BibleTilesAppBar<T>(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              controller.logo,
              width: 300,
              fit: BoxFit.fitWidth,
            ),
            Obx(
              () {
                if (!controller.hasInitialised) {
                  return LoadingAnimationWidget.horizontalRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 50,
                  );
                }
                return const SizedBox();
              },
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: controller.hasInitialised ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: TextView(
                  text: controller.description,
                  textAlign: TextAlign.center,
                  type: HeadingType.headlineSmall,
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    margin: EdgeInsets.only(top: controller.hasInitialised ? buttonSpacing : buttonAnimationTravelDistance),
                    duration: const Duration(seconds: 1),
                    child: AnimatedOpacity(
                      opacity: controller.hasInitialised ? 1 : 0,
                      duration: const Duration(seconds: 2),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.goToPlay();
                        },

                        style: OutlinedButton.styleFrom(

                            backgroundColor: Theme.of(context).colorScheme.primary,),
                        child:  TextView(
                          text: "Play",
                          style: TextStyle(color:Theme.of(context).colorScheme.onPrimary ),
                          type: HeadingType.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    margin: EdgeInsets.only(top: controller.hasInitialised ? buttonSpacing : buttonAnimationTravelDistance,left: buttonSpacing),
                    duration: const Duration(seconds: 1),
                    child: AnimatedOpacity(
                      opacity: controller.hasInitialised ? 1 : 0,
                      duration: const Duration(seconds: 2),
                      child: OutlinedButton(
                        onPressed: () {
                          controller.goToTour();
                        },

                        style: OutlinedButton.styleFrom(

                          backgroundColor: Theme.of(context).colorScheme.primary,),
                        child:  TextView(
                          text: "Take a tour",
                          style: TextStyle(color:Theme.of(context).colorScheme.onPrimary ),
                          type: HeadingType.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
