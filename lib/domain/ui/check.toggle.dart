

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckToggle extends StatelessWidget{
  final bool defaultState;
  final RxBool value = RxBool(false);
  final String label;
  final Function(bool state) onStateChange;


   CheckToggle({super.key, required this.defaultState, required this.label, required this.onStateChange}){
    value(defaultState);
  }

  @override
  Widget build(BuildContext context) {
   return Obx(()=>Padding(
     padding: const EdgeInsets.all(8.0),
     child: ToggleButtons(
       isSelected: <bool>[value.value],
       onPressed: (int newIndex) {
         onStateChange(!value.value);
         value(!value.value);
       },
       selectedBorderColor: Colors.transparent,
       borderWidth: 0,
       borderColor: Colors.transparent,
       children: <Widget>[
         AnimatedSwitcher(
           duration: const Duration(seconds: 1),
           child: value.value == true
               ? Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(label),
                 ),
                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(Icons.check_box),
                 )
               ],
             ),
           )
               : Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(label),
                 ),
                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(Icons.check_box_outline_blank),
                 )
               ],
             ),
           ),
         )
       ],
     ),
   ));
  }

}