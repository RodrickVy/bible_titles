import 'package:bibletiles/domain/models/game/level.dart';
import 'package:bibletiles/domain/models/structures/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/check.toggle.dart';
import 'package:bibletiles/domain/ui/heading.dart';

import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SetupLevel<T extends PlayGameViewModel> extends AView<T> {
  const SetupLevel({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextView(
              text: "How hard?",
              type: HeadingType.displaySmall,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ...GameLevel.values.map2((GameLevel level, index) {
                  return CheckToggle(
                      defaultState: controller.level == level,
                      label: level.name,
                      onStateChange: (bool state) {
                        controller.setLevel(level);
                      });
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton(
            onPressed: () {
              controller.nextStage();
            },
            child: const TextView(
              text: "Continue",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
              onPressed: () {
                controller.previousStage();
              },
              child: const TextView(
                text: "Back",
              ))
        ],
      ),
    );
  }
}