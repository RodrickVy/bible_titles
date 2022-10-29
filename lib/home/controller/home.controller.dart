

import 'package:bibletiles/home/interface/home.view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements HomeViewModel{
  
  final RxBool _hasInitialised = false.obs;
  @override
  String get name => 'Bible.tiles';

  @override
  String get icon => 'assets/logos/icon.png';

  @override
  String get logo =>  'assets/logos/logo_bg_white.png';

  @override
  String get description => "A 2d bible game to play with friends deepening your knowledge of God's word and ultimately Christ!";

  @override
  bool get hasInitialised => _hasInitialised.value;


  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1),(){
      _hasInitialised(true);
    });
  }

  @override
  void goToPlay() {
    Get.toNamed('/setup');
  }

  @override
  void goToTour() {
    Get.toNamed('/tour');
  }
}