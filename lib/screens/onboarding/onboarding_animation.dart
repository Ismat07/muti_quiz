import 'package:flutter/material.dart';

class OnBoardingEnterAnimation {
  OnBoardingEnterAnimation(this.controller)
      : colorAnimation = new ColorTween(
  ).animate(
    new CurvedAnimation(
      parent: controller,
      curve: new Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ),
  );

  final AnimationController controller;
  final Animation<Color> colorAnimation;
}