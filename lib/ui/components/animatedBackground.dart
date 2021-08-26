import 'package:flutter/material.dart';
import 'package:habirandom/constants/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { center }

class AnimatedBackground extends StatelessWidget {
  final animationFactor = 5;

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(begin: 0.seconds, duration: (1 * animationFactor).seconds)
          .animate(AniProps.center, tween: (0.5).tweenTo(1.0))
      ..addScene(
              begin: (1 * animationFactor).seconds,
              duration: (1 * animationFactor).seconds)
          .animate(AniProps.center, tween: (1.0).tweenTo(0.5));

    return LoopAnimation(
      tween: tween,
      duration: tween.duration,
      builder: (context, child, value) {
        return Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(radius: value.get(AniProps.center),
                  // begin:
                  //     Alignment(value.get(AniProps.x), value.get(AniProps.y)),
                  // end: Alignment.center,
                  colors: [MyColors.white, MyColors.orange])),
        );
      },
    );
  }
}
