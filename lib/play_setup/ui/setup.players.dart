
import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/structures/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';

import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetupPlayers<T extends PlayGameViewModel> extends AView<T> {
  const SetupPlayers({super.key});

  static final Rx<TextEditingController> playerNameSuggestedEditor = TextEditingController(text: '').obs;

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () => SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextView(
                text: "Time For the Players : ${controller.players.length}",
                type: HeadingType.displaySmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextView(
                text: "minimum 3 player and 7 max players",
                type: HeadingType.bodySmall,
              ),
            ),
            Container(
              width: adapt(phone: 200, tablet: 300, desktop: 420),
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: playerNameSuggestedEditor.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Add Player",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: IconButton(
                      padding: const EdgeInsets.all(7.0),
                      onPressed: () {
                        playerNameSuggestedEditor(TextEditingController(text: controller.suggestName()));
                      },
                      icon: const Icon(
                        Icons.loop,
                      ),
                    ),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.all(7.0),
                      onPressed: () {
                        controller.addPlayer(Player(
                            name: playerNameSuggestedEditor.value.text,
                            image: 'image',
                            points: 0,
                            attemptedTiles: []));
                      },
                      icon: const Icon(Icons.check),
                    )),
              ),
            ),
            ...controller.players.map2((player, index) {
              return Container(
                width: adapt(phone: 200, tablet: 300, desktop: 420),
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  title: TextView(
                    text: player.name,
                  ),
                  leading: IconButton(
                    padding: const EdgeInsets.all(7.0),
                    onPressed: () {
                      controller.removePlayer(player);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(
              height: 25,
            ),

            OutlinedButton(
              onPressed:controller.players.length > 2 ?( () {
                controller.nextStage();
              }):null,

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
      ),
    );
  }
}
