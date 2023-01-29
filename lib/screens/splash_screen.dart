
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mtmap/screens/map_screen.dart';

import 'constants.dart';

class Splash extends StatefulWidget {
  static String tag = '/Splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late SpinKitFadingCircle spinkit;

  @override
  void initState() {
    spinkit = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: index.isEven ? colorSpin : Colors.white,
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () async {

      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MapScreen()), (Route<dynamic> route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorPrimary,
                colorPrimaryAccent,
                colorPrimary ],
              stops: [
                0,
                0.5063160061836243,
                1
              ],
              begin: Alignment(-0.41, -0.91),
              end: Alignment(0.41, 0.91),
              // angle: 156,
              // scale: undefined,
            )
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 12.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Icon(Icons.location_on_rounded, color: Colors.white,size: 38,)),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Container(
                        child: Text("Welcome ...",style: TextStyle(color: Colors.white, fontSize: 28),)),
                    const SizedBox(
                      height: 48.0,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: spinkit
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

