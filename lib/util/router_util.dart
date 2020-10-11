import 'package:flutter/material.dart';

enum PushAnimation { from_right, fade_from_bottom }

class FadeFromRightTransition extends StatelessWidget {
  FadeFromRightTransition({
    Key key,
    @required
        Animation<double>
            routeAnimation, // The route's linear 0.0 - 1.0 animation.
    @required this.child,
  })  : _positionAnimation =
            routeAnimation.drive(_bottomUpTween.chain(_fastOutSlowInTween)),
        _opacityAnimation = routeAnimation.drive(_easeInTween),
        super(key: key);

  // Fractional offset from 1/4 screen below the top to fully on screen.
  static final Tween<Offset> _bottomUpTween = Tween<Offset>(
    begin: const Offset(0.25, 0),
    end: Offset.zero,
  );
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _positionAnimation;
  final Animation<double> _opacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _positionAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: child,
      ),
    );
  }
}

class RouterUtil {
  static Future<T> push<T>(BuildContext context, String routeName,
      {Object arguments}) async {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }
}
