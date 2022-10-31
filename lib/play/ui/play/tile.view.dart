import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TileView<T extends PlayGameViewModel> extends AView<T> {
  final Tile tile;

  const TileView({required this.tile, super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Obx(() {
      return Opacity(
        opacity: controller.tilesOpened.contains(tile.id) ? 0.4 : 1,
        child: GestureDetector(
          onTap: () {},
          child: Material(
            elevation: 5,
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            color: Get.theme.colorScheme.primary,
            child: Container(
              width: 100,
              height: 70,
              margin: const EdgeInsets.all(12),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(2.0),
              child: TextView(
                text: tile.points.toString(),
                type: HeadingType.displaySmall,
                style: TextStyle(fontWeight: FontWeight.w900, color: Get.theme.colorScheme.secondary.withAlpha(178)),
              ),
            ),
          ),
        ),
      );
    });
  }
}
