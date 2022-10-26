import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final HeadingType type;
  final TextStyle? style;
  final TextAlign textAlign;
  const TextView({
    Key? key,  this.type = HeadingType.titleMedium,  this.textAlign =  TextAlign.start,required this.text,  this.style,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style:headingStyle(context)?.copyWith(color: style?.color,),
        textAlign: textAlign,
      ),
    );
  }


  TextStyle?  headingStyle(BuildContext context){
    switch(type){

      case HeadingType.displayLarge:
     return  Theme.of(context).textTheme.displayLarge;
      case HeadingType.displayMedium:
     return  Theme.of(context).textTheme.displayMedium;
      case HeadingType.displaySmall:
     return  Theme.of(context).textTheme.displaySmall;
      case HeadingType.headlineMedium:
     return  Theme.of(context).textTheme.headlineMedium;
      case HeadingType.headlineSmall:
     return  Theme.of(context).textTheme.headlineSmall;
      case HeadingType.titleLarge:
     return  Theme.of(context).textTheme.titleLarge;
      case HeadingType.titleMedium:
     return  Theme.of(context).textTheme.titleMedium;
      case HeadingType.titleSmall:
     return  Theme.of(context).textTheme.titleSmall;
      case HeadingType.bodyLarge:
     return  Theme.of(context).textTheme.bodyLarge;
      case HeadingType.bodyMedium:
     return  Theme.of(context).textTheme.bodyMedium;
      case HeadingType.button:
     return  Theme.of(context).textTheme.button;
      case HeadingType.bodySmall:
     return  Theme.of(context).textTheme.bodySmall;
      case HeadingType.overline:
     return  Theme.of(context).textTheme.overline;
    }
  }
}

enum HeadingType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  button,
  bodySmall,
  overline,
}
