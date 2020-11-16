import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  final _fontShadowOffset = 2.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _animation = Tween(begin: 0.8, end: 2.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black
            // image: DecorationImage(
            //   image: AssetImage("assets/tile_bg.jpg"),
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(
            //       Colors.black.withOpacity(0.8), BlendMode.dstATop),
            // ),
            ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/snake.png",
                  height: size.height * 0.5,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                child: ScaleTransition(
                  scale: _animation,
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontFamily: 'SansitaSwashed',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(_fontShadowOffset * -1,
                                  _fontShadowOffset * -1),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(_fontShadowOffset * 1,
                                  _fontShadowOffset * -1),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(
                                  _fontShadowOffset * 1, _fontShadowOffset * 1),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(_fontShadowOffset * -1,
                                  _fontShadowOffset * 1),
                              color: Colors.black),
                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: size.height*0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Text(
                  'Inoxza Solution',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'SansitaSwashed',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
