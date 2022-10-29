import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/models/game/tile.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/play_setup/controller/play.setup.controller.dart';
import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:flutter/material.dart';

class PlayGamePage extends AView<PlaySetupController> {
  const PlayGamePage({super.key});

  @override
  Widget builder(BuildContext context, PlaySetupController controller) {
    return Scaffold(
      appBar: const BibleTilesAppBar<HomeController>(),
      body: TileView(controller.availableCategories.first.tiles.first),
    );
  }
}





class TileView<T extends PlayGameViewModel> extends AView<T> {
  final Tile tile;

 const TileView(this.tile, {super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        border:  Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Text(
        tile.points.toString()
      ),
    );
  }

}

