import 'package:bibletiles/domain/models/game/mode.dart';
import 'package:bibletiles/domain/models/structures/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/check.toggle.dart';
import 'package:bibletiles/domain/ui/heading.dart';

import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupMode<T extends PlayGameViewModel> extends AView<T> {
  const SetupMode({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextView(
                text: "Are you playing in teams or one by one?",
                type: HeadingType.displaySmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...GameMode.values.map2((GameMode mode, index) {
                  return CheckToggle(
                      defaultState: controller.gameType == mode,
                      label: mode.name,
                      onStateChange: (bool state) {
                        controller.selectGameType(mode);
                      });
                }),
              ],
            ),
            const SizedBox(height: 25),
            OutlinedButton(
              onPressed: () {
                controller.nextStage();
              },
              child: const TextView(
                text: "Continue",
              ),
            )
          ],
        ),
      ),
    );
  }
}