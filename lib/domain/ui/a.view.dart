import 'package:bibletiles/domain/ui/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AView<T extends Object> extends StatelessWidget  with Adaptive{
  const AView({super.key});

  @override
  BuildContext get  context => Get.context!;

  @override
  Widget build(BuildContext context) {
    return builder(context, Get.find<T>());
  }

  Widget builder(BuildContext context, T controller);
}
