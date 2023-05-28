import 'package:flutter/material.dart';
import 'package:rise_up/core/utils/constants.dart';

class SlidingAnimationImage extends StatelessWidget {
  const SlidingAnimationImage({
    Key? key,
    required this.slidingAnimationImage,
  }) : super(key: key);

  final Animation<Offset> slidingAnimationImage;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimationImage,
      builder: (context ,_){
        return SlideTransition(
          position: slidingAnimationImage,
          child: Center(child: Image(image: const AssetImage(riseUpLogo),width: MediaQuery.of(context).size.width*.4,fit: BoxFit.fitWidth,)),);
      },);
  }
}

