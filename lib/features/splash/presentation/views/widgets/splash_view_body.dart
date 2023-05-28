import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up/features/splash/presentation/views/widgets/sliding_animation_image.dart';

import '../../../../../core/utils/router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimationImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlidingAnimationImage(slidingAnimationImage: slidingAnimationImage),
      ],
    );
  }
  void initSlidingAnimation() {
    animationController=AnimationController(vsync: this, duration:  const Duration(seconds: 2));
    slidingAnimationImage =Tween(begin: const Offset(2, 0), end: const Offset(0, 0)).animate(animationController);

    animationController.forward();

  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRouter.homeView);
       },);
  }
}
