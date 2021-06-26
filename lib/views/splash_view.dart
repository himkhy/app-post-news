import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:postnews/helpers/share_preference.dart';
// import 'package:postnews/helpers/share_preference_key.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
//  bool isHasUser = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //initialize firebase app
      //await Firebase.initializeApp();

      Timer(Duration(seconds: 2), () async {
        //check for login user firebase
        //  var firebaseUser = FirebaseAuth.instance.currentUser;
        //   if (firebaseUser != null) {
        //     var token = await AppSharePreference.instance
        //         .getString(SharePreferenceKey.kTOKEN);
        //     var cusID = await AppSharePreference.instance
        //         .getString(SharePreferenceKey.kCusID);

        //     if (token == '' || cusID == '') {
        //       //user is log out
        //       await FirebaseAuth.instance.signOut();
        //     } else {
        //       //user is log in
        //       Navigator.of(context).pushReplacementNamed("/main_screen");
        //       return;
        //     }
        //   }
        //
        Navigator.of(context).pushReplacementNamed("/main_view");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
     color: Colors.white,
        child: Center(
          child: Image.asset(
            "assets/images/ic_logo.png",
            fit: BoxFit.fitWidth,
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}
