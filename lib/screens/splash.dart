import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jr/models/database.dart';
import 'package:jr/screens/home.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn;
    context.read<DataBase>().checkAuth();
    var dbclass = context.read<DataBase>();

    if (dbclass.isLoggedIn == true) {
      isLoggedIn = dbclass.isLoggedIn;
      Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        ),
      );
      print('you are logged in');
    } else {
      isLoggedIn = dbclass.isLoggedIn;
      // print('false');
    }

    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Image(
                image: AssetImage(
                  "assets/images/jrlogo.png",
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50.0,
            child: LinearProgressIndicator(
              minHeight: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
