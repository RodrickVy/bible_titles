
import 'package:bibletiles/domain/ui/adaptive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Makes you widget adaptive  by mixing in [Adaptive]
abstract class AdaptView extends StatelessWidget with Adaptive {
  // todo figure out how to get context rolling throughout the app.
   AdaptView({Key? key}) : super(key: key);

  @override
  late  BuildContext  context;

  @override
  @nonVirtual
  Widget build(BuildContext context){
    context = context;
    return builder(context);
  }



  Widget builder(BuildContext context);
}
