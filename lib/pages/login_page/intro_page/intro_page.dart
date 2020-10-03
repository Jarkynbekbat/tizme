import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

import 'elements/intro_page__data.dart';
import 'elements/intro_page__indicator.dart';

class IntroPage extends StatefulWidget {
  static const String route = '/intro';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  PageController _controller;
  int _currentPage;
  // ignore: unused_field
  bool _isLastPage;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _isLastPage = false;
    _controller = PageController(initialPage: _currentPage);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF485563), Color(0xFF29323C)],
          tileMode: TileMode.clamp,
          begin: Alignment.topCenter,
          stops: [0.0, 1.0],
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;
                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                          child: Image.asset(page.imageUrl),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                    colors: pageList[index].titleGradient,
                                  ),
                                  style: TextStyle(
                                    fontSize: 90.0,
                                    fontFamily: "Montserrat-Black",
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 22.0),
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(colors: pageList[index].titleGradient),
                                  style: TextStyle(
                                    fontSize: 60.0,
                                    fontFamily: "Montserrat-Black",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 12.0, right: 10.0),
                          child: Transform(
                            transform: Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Montserrat-Medium",
                                color: Color(0xFF9B9B9B),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(width: 160.0, child: IntroPageIndicator(_currentPage, pageList.length)),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      if (_currentPage == pageList.length - 1) {
        _isLastPage = true;
        _animationController.forward();
      } else {
        _isLastPage = false;
        _animationController.reset();
      }
    });
  }
}
