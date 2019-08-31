import 'package:flutter/material.dart';
import 'package:multiple_quiz/components/forward_button.dart';
import 'package:multiple_quiz/components/trapozoid_cut_colored_image.dart';
import 'package:multiple_quiz/lang_select.dart';
import 'package:multiple_quiz/screens/registrat/regist_animation.dart';

abstract class GoToLoginListener {
  void onGoAheadTap();
}

class RegistPage extends StatelessWidget {

  String name;
  bool _validate = false;

  RegistPage(
      {@required AnimationController controller,
      @required this.goTOLoginListener})
      : registEnterAnimation = new RegistEnterAnimation(controller);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RegistEnterAnimation registEnterAnimation;
  final GoToLoginListener goTOLoginListener;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      //color: Colors.blue,
      child: Stack(
      children: <Widget>[
        _trapoziodView(size, textTheme),
        _buttonContainer(size, context),
      ],
      )
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, -registEnterAnimation.translation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildTextHeader(size, textTheme),
            _buildForm(size, textTheme)
          ],
        ),
      )),
    );
  }

  Widget _buildForm(Size size, TextTheme textTheme) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.3, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidate: _validate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: _buildTextFormUsername(textTheme),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1,
                  ),
                  child: _buildTextFormPassword(textTheme),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buttonContainer(Size size,BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform(
                transform: Matrix4.translationValues(
                    registEnterAnimation.translation.value * 100, 0.0, 0.0),
                child: FlatButton(
                  padding: EdgeInsets.only(right: 60.0),
                  onPressed: () {
                    goTOLoginListener.onGoAheadTap();
                  },
                  child: Text(
                    "LOG IN",
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
            SizedBox(
              width: 16,
            ),
            Transform(
              transform: Matrix4.translationValues(
                  registEnterAnimation.translation.value * 200, 0.0, 0.0),
              child: ForwardButton(
                  label: "PROCEED",
                  onPressed:() {
                    if (formKey.currentState.validate()) {
                      Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new lang_select()
                        )
                      );
                      formKey.currentState.save();
                    }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: new AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(
                      Colors.white70,
                      BlendMode.overlay
                  )
          )
      ),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          -registEnterAnimation.Xtranslation.value * size.width, 0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 120.0),
        child: new Text(
          "SIGN UP",
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormUsername(TextTheme textTheme) {
    return FadeTransition(
      opacity: registEnterAnimation.userNameOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(
            color: Colors.black87,
            fontSize: 16.0,
            letterSpacing: 1.2
        ),
        decoration: new InputDecoration(
          hintText: "User Name",
          hintStyle: textTheme.subhead.copyWith(color: Colors.black87),
          icon: Icon(
            Icons.person,
            color: Colors.black87,
          ),
          contentPadding: const EdgeInsets.all(5.0),
          errorStyle: TextStyle(
            color: Colors.redAccent[700],
            wordSpacing: 2.0,
          ),
          //contentPadding: EdgeInsets.zero,
        ),
        keyboardType: TextInputType.text,
        maxLength: 10,
        controller: userNameController,
        validator:validateName,
        onSaved: (String val) {
          name = val;
        },
      ),
    );
  }

  Widget _buildTextFormPassword(TextTheme textTheme) {
    return FadeTransition(
      opacity: registEnterAnimation.passowrdOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(
          color: Colors.black87,
          fontSize: 16.0,
          letterSpacing: 1.2
      ),
        decoration: new InputDecoration(
            hintText: "Mobile number",
            hintStyle: textTheme.subhead.copyWith(color: Colors.black87),
            icon: Icon(
                Icons.phone_android,
                color: Colors.black87
            ),
            contentPadding: const EdgeInsets.all(5.0),
            errorStyle: TextStyle(
              color: Colors.redAccent[700],
              wordSpacing: 2.0,
            ),
        ),
        keyboardType: TextInputType.number,
        controller: passwordController,
        validator: validateMobile,
        onSaved: (String val) {
          name = val;
        },
      ),
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^[6-9]\d{9}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile number can\'t be empty!";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile number must be digits";
    }
    return null;
  }

  String validateName(String value) {
    if (value.length == 0) {
      return "Name can\'t be empty!";
    }
    return null;
  }
}
