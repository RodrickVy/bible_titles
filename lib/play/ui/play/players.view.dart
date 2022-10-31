

import 'package:bibletiles/domain/ui/a.view.dart';
import 'package:bibletiles/play/interface/play.game.view_model.dart';
import 'package:bibletiles/play/ui/play/player.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayersView<T extends PlayGameViewModel> extends AView<T> {
  @override
  Widget builder(BuildContext context, T controller) {
    return Wrap(
      alignment: WrapAlignment.center,
      children:[
        ...controller.players.values.map((e){
          return PlayerView<T>(e.id);
        }).toList()
      ]
    );
  }

}