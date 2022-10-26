



import 'package:bibletiles/home/ui/home.view.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BibleTilesAppBar<T extends HomeViewModel> extends PreferredSize {
  const BibleTilesAppBar({super.key,}):super(preferredSize:const Size.fromHeight(50),child: const SizedBox());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text( Get.find<T>().name),
    );
  }

}