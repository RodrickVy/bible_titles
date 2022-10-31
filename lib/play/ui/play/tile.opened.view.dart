import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TileOpened<T extends PlayGameViewModel> extends AView<T> {
  const TileOpened({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(
          () {
        if (controller.currentPlayer != null) {
          return SizedBox(
            width: Get.width - 30,
            height: Get.height - 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextView(text: controller.currentPlayer!.name),
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}