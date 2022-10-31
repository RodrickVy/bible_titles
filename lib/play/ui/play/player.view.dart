import 'package:bibletiles/domain/models/game/player.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/domain/ui/heading.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PlayerView<T extends PlayGameViewModel> extends AView<T> {
  final int playerId;

  const PlayerView(this.playerId, {super.key});

  @override
  Widget builder(BuildContext context, T controller) {

    return Obx(
      () {
        final Player player = controller.players[playerId]!;

        return Container(
        width: 200,
        // height: 120,
        margin: const EdgeInsets.all(12),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Material(
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          shape:  RoundedRectangleBorder(
              side: BorderSide(color: (controller.currentPlayer?.id != null && controller.currentPlayer!.id == player.id)? Colors.green:Colors.black12, width: 5), borderRadius: BorderRadius.all(Radius.circular(12))),
          color: Get.theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                CircleAvatar(backgroundImage: AssetImage(player.image),radius: 20,),
                TextView(
                  text: player.name,
                  type: HeadingType.bodyLarge,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Get.theme.colorScheme.onPrimary),
                ),
                TextView(
                  text: player.points.toString(),
                  type: HeadingType.headlineSmall,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, color: Get.theme.colorScheme.secondary.withAlpha(178)),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Expanded(child: Container(
                //       color: Colors.red,
                //       alignment: Alignment.center,
                //       child:  IconButton(
                //           onPressed: () {},
                //           icon: const Icon(Icons.minimize)
                //       ),
                //     )),
                //     Expanded(child: Container(
                //       color: Colors.green,
                //       alignment: Alignment.center,
                //       child:  IconButton(
                //           onPressed: () {},
                //           icon: const Icon(Icons.add)
                //       ),
                //     )),
                //   ],
                // )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
