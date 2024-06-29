// simple animation lastest version
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {

  final double delay;
  final Widget child;

  FadeAnimation({required this.delay, required  this.child});

  @override
  Widget build(BuildContext context) {
    final opacity = MovieTweenProperty<double>();
    final translateY = MovieTweenProperty<double>();
    final tween = MovieTween()
      ..tween<double>(opacity, Tween(begin: 0.0, end: 1.0), duration: 500.milliseconds)
      ..tween<double>(translateY, Tween(begin: -30.0, end: 0), duration: 500.milliseconds, curve: Curves.easeIn);


    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: opacity.from(value),
        child: Transform.translate(
            offset: Offset(0, translateY.from(value)), child: child),
      ),
    );
  }
}