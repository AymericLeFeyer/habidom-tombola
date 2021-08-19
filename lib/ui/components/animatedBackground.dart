import 'package:flutter/material.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { x, y }

class AnimatedBackground extends StatelessWidget {
  final animationFactor = 5;

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(begin: 0.seconds, duration: (1 * animationFactor).seconds)
          .animate(AniProps.x, tween: (-1.0).tweenTo(1.0))
      ..addScene(
              begin: (1 * animationFactor).seconds,
              duration: (1 * animationFactor).seconds)
          .animate(AniProps.y, tween: (-1.0).tweenTo(1.0))
      ..addScene(
              begin: (2 * animationFactor).seconds,
              duration: (1 * animationFactor).seconds)
          .animate(AniProps.x, tween: (1.0).tweenTo(-1.0))
      ..addScene(
              begin: (3 * animationFactor).seconds,
              duration: (1 * animationFactor).seconds)
          .animate(AniProps.y, tween: (1.0).tweenTo(-1.0));

    return LoopAnimation(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:
                      Alignment(value.get(AniProps.x), value.get(AniProps.y)),
                  end: Alignment.center,
                  colors: [MyColors.white, MyColors.orange])),
        );
      },
    );
  }
}
