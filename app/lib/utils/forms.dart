

import 'package:flutter/material.dart';


class CustomForm extends StatelessWidget {
  final GlobalKey formKey;
  final Widget child;
  final double? width;
  final double? height;
  final Color colorContainer;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets containerPadding; 
  final Alignment alignment; 

  const CustomForm({
    super.key,
    required this.formKey,
    required this.child,
    this.width ,
    this.height ,
    this.colorContainer = Colors.transparent,
    this.boxShadow,
    this.containerPadding = const EdgeInsets.all(40),
    this.alignment = Alignment.center
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container( 
        width: width,
        height: height,
        padding: containerPadding,
        alignment: alignment,
        decoration: BoxDecoration(
          color:colorContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: boxShadow
        ), 
      

      child: Form(
        
        key: formKey,
        child: child,
      )));
  }
}

