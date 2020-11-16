import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/tile_bg.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: HeaderImage()),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    child: ButtonContent(center: false),
                  ),
                ],
              ),
            );
          }

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tile_bg.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
              ),
            ),
            child: Row(
              children: [
                Expanded(child: HeaderImage()),
                Expanded(child: ButtonContent(center: true))
              ],
            ),
          );
        },
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black45,
      child: Center(
        child: Text('Image', style: TextStyle(fontSize: 36.0),),
      ),
    );
  }
}

class ButtonContent extends StatefulWidget {
  final bool center;

  const ButtonContent({Key key, this.center}) : super(key: key);

  @override
  _ButtonContentState createState() => _ButtonContentState();
}

class _ButtonContentState extends State<ButtonContent>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  static const _playGradient = LinearGradient(colors: <Color>[
    Colors.lightGreenAccent,
    Color(0xFF558B2F),
    Color(0xFF33691E),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const _playBtnTextColor = Colors.white;
  static const _btnCornerRadius = 10.0;
  static const _btnFontShadowOffset = 1.0;

  static const _settingsGradient = LinearGradient(colors: <Color>[
    Colors.amberAccent,
    Color(0xFFFFB300),
    Color(0xFFFF6F00),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animation =
        Tween(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        mainAxisAlignment: widget.center ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          RaisedButton(
            elevation: 20,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_btnCornerRadius),
                side: BorderSide(color: Colors.black, width: 2.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: _settingsGradient,
                borderRadius:
                BorderRadius.all(Radius.circular(_btnCornerRadius)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0, minHeight: 36.0, maxWidth: 180),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 0.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: _playBtnTextColor,
                      fontSize: 16.0,
                      fontFamily: 'SansitaSwashed',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          // bottomLeft
                            offset: Offset(_btnFontShadowOffset * -1,
                                _btnFontShadowOffset * -1),
                            color: Colors.black),
                        Shadow(
                          // bottomRight
                            offset: Offset(_btnFontShadowOffset * 1,
                                _btnFontShadowOffset * -1),
                            color: Colors.black),
                        Shadow(
                          // topRight
                            offset: Offset(_btnFontShadowOffset * 1,
                                _btnFontShadowOffset * 1),
                            color: Colors.black),
                        Shadow(
                          // topLeft
                            offset: Offset(_btnFontShadowOffset * -1,
                                _btnFontShadowOffset * 1),
                            color: Colors.black),
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            elevation: 20,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_btnCornerRadius),
                side: BorderSide(color: Colors.black, width: 2.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: _playGradient,
                borderRadius:
                    BorderRadius.all(Radius.circular(_btnCornerRadius)),
              ),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0, minHeight: 36.0, maxWidth: 180),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 0.0),
                child: ScaleTransition(
                  scale: _animation,
                  alignment: Alignment.center,
                  child: Text(
                    'start'.toUpperCase(),
                    style: TextStyle(
                        color: _playBtnTextColor,
                        fontSize: 28.0,
                        fontFamily: 'SansitaSwashed',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            // bottomLeft
                              offset: Offset(_btnFontShadowOffset * -1,
                                  _btnFontShadowOffset * -1),
                              color: Colors.black),
                          Shadow(
                            // bottomRight
                              offset: Offset(_btnFontShadowOffset * 1,
                                  _btnFontShadowOffset * -1),
                              color: Colors.black),
                          Shadow(
                            // topRight
                              offset: Offset(_btnFontShadowOffset * 1,
                                  _btnFontShadowOffset * 1),
                              color: Colors.black),
                          Shadow(
                            // topLeft
                              offset: Offset(_btnFontShadowOffset * -1,
                                  _btnFontShadowOffset * 1),
                              color: Colors.black),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
