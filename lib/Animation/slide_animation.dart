import 'package:flutter/material.dart';

class SlideToPage extends PageRouteBuilder {
  final Widget page;
  SlideToPage({required this.page})
      : super(
            pageBuilder: (context, animation, animationTo) => page,
            transitionsBuilder: (context, animation, animationTo, child) {
              var begin = 0.0; //Offset(-1, 1);
              var end = 1.0; //Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              // var offsetAnimation = animation.drive(tween);
              var curve =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return ScaleTransition(
                scale: tween.animate(curve),
                child: child,
              );
            });
}

class SlideFromRight extends PageRouteBuilder {
  final Widget page;
  SlideFromRight({required this.page})
      : super(
            pageBuilder: (context, animation, animationTo) => page,
            transitionsBuilder: (context, animation, animationTo, child) {
              var begin = Offset(-1, 1);
              var end = Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              // var offsetAnimation = animation.drive(tween);
              var curve =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return SlideTransition(
                position: tween.animate(curve),
                child: child,
              );
            });
}
