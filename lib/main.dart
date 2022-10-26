import 'package:bibletiles/firebase_options.dart';
import 'package:bibletiles/home/controller/home.controller.dart';
import 'package:bibletiles/home/ui/home.view.dart';
import 'package:bibletiles/play_setup/controller/play.setup.controller.dart';
import 'package:bibletiles/play_setup/ui/play.setup.view.dart';
import 'package:bibletiles/tour/controller/tour.controller.dart';
import 'package:bibletiles/tour/ui/tour.view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configure/configure.nonweb.dart' if (dart.library.html) 'configure/configure.web.dart';
void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BindBibleTiles().dependencies();
  runApp(const BibleTilesApp());
}


class BindBibleTiles extends Bindings {
  @override
  void dependencies() {

    Get.put(HomeController());
    Get.put(TourController());
    Get.put(PlaySetupController());
  }

}

class BibleTilesApp extends StatelessWidget {
  const BibleTilesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      title: Get
          .find<HomeController>()
          .name,
      theme: FlexThemeData.light(scheme:FlexScheme.bigStone,subThemesData: const FlexSubThemesData(
        defaultRadius: 0
      ) ),

      getPages: [
        GetPage(name: '/', page: () => const HomeView<HomeController>()),
        GetPage(name: '/tour', page: () => const TourPage<TourController>()),
        GetPage(name: '/setup', page: () => const PlaySetupPage<PlaySetupController>()),
        GetPage(name: '/setup/:stage', page: () => const PlaySetupPage<PlaySetupController>())
      ],
    );
  }
}

