import 'package:bibletiles/domain/models/game/setup.stage.dart';
import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/appbar.view.dart';
import 'package:bibletiles/play_setup/interface/play.game.view_model.dart';
import 'package:bibletiles/play_setup/ui/setup.categories.dart';
import 'package:bibletiles/play_setup/ui/setup.level.dart';
import 'package:bibletiles/play_setup/ui/setup.mode.dart';
import 'package:bibletiles/play_setup/ui/setup.players.dart';
import 'package:flutter/material.dart';

class GameSetupPage<T extends PlayGameViewModel> extends AView<T> {
  const GameSetupPage({super.key});

  @override
  Widget builder(BuildContext context, T controller) {
    return Scaffold(
      appBar: const BibleTilesAppBar<HomeController>(),
      body: () {
        switch (controller.setupStage) {
          case SetUpStage.categoriesSetup:
            return SetupCategories<T>();
          case SetUpStage.playersSetup:
            return SetupPlayers<T>();
          case SetUpStage.typeSetup:
            return SetupMode<T>();
          case SetUpStage.levelSetup:
            return SetupLevel<T>();
        }
      }(),
    );
  }
}







