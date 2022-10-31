import 'package:bibletiles/domain/models/game/tiles.category.dart';
import 'package:bibletiles/domain/models/structures/list.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:bibletiles/play/ui/play/tile.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TilesGrid<T extends PlayGameViewModel> extends AView<T> {
  const TilesGrid({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: Get.width,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primary,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ...controller.selectedCategories.map((TilesCategory category) => Container(
              width: adapt(phone: Get.width, tablet: 180, desktop: 300),
              padding: const EdgeInsets.only(top: 20, left: 2, bottom: 10, right: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.primary,
                        border: Border.fromBorderSide(
                          BorderSide(color: Get.theme.colorScheme.secondary.withAlpha(78), width: 5),
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      height: 60,
                      child: FittedBox(
                        child: TextView(
                          text: category.name.toUpperCase(),
                          textAlign: TextAlign.center,
                          type: HeadingType.titleMedium,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 5,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: const Material(
                          elevation: 34,
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                  ...category.generateTiles.map2((e, index) => TileView<T>(tile: e)).toList()
                ],
              )))
        ],
      ),
    );
  }
}