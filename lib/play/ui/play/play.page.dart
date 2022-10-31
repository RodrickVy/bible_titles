import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:bibletiles/play/ui/play/player.view.dart';
import 'package:bibletiles/play/ui/play/players.view.dart';
import 'package:bibletiles/play/ui/play/tiles.grid.view.dart';
import 'package:flutter/material.dart';

class PlayGamePage<T extends PlayGameViewModel> extends AView<T> {
  const PlayGamePage({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Scaffold(
      appBar: const BibleTilesAppBar<HomeController>(),
      body: ListView(
        children: [TilesGrid<T>(), PlayersView<T>()],
      ),
    );
  }
}
