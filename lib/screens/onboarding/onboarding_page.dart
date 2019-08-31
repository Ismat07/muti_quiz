import 'package:flutter/material.dart';
import 'package:multiple_quiz/screens/login/login_page.dart';
import 'package:multiple_quiz/screens/onboarding/onboarding_animation.dart';
import 'package:multiple_quiz/screens/registrat/regist_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin implements GoToLoginListener, GoToRegistListener{

  AnimationController animationControllerRegist;
  AnimationController animationControllerLogin;

  OnBoardingEnterAnimation onBoardingEnterAnimation;

  int _contentScreenState;

  @override
  void initState() {
    super.initState();

    animationControllerLogin = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this
    )
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 2;
            });
            animationControllerRegist.forward();
            break;
        }
      })..addListener(() {
        setState(() {

        });
      });

    animationControllerRegist = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this
    )
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 1;
            });
            animationControllerLogin.forward();
            break;
        }
      })..addListener(() {
        setState(() {

        });
      });

    setState(() {
      _contentScreenState = 1;
    });

    onBoardingEnterAnimation = OnBoardingEnterAnimation(animationControllerRegist);

    animationControllerLogin.forward();
  }

  @override
  void dispose() {
    animationControllerRegist.dispose();
    animationControllerLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyanAccent[400],
        body: getCurrentWidget()
    );
  }

  @override
  void onGoAheadTap() {
    animationControllerRegist.reverse();
  }

  Widget getCurrentWidget() {
    switch(_contentScreenState) {
      case 1: return LoginPage(controller: animationControllerLogin, goToRegistListener: this);
      case 2: return RegistPage(controller: animationControllerRegist, goTOLoginListener: this);
      default: return Offstage();
    }
  }

  @override
  void onGoToWelcomeTap() {
    animationControllerLogin.reverse();
  }
}