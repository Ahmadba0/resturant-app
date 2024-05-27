import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInBack,
        verticalOffset: 100,
        child: FadeInAnimation(
          child: Container(
            height: 500,
            child: Center(
              child: Lottie.asset("assets/lottie/empty.json",
                  width: 200, height: 200),
            ),
          ),
        ),
      ),
    );
  }
}
