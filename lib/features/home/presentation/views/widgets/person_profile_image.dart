import 'package:flutter/material.dart';

class PersonProfileImage extends StatelessWidget {
  const PersonProfileImage({Key? key, required this.activatedColor}) : super(key: key);
  final Color activatedColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: const Center(child: Icon(Icons.person, color: Colors.grey,size: 70,))),
        Positioned(
          bottom: 5,
          right: 10,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                color: activatedColor,
                borderRadius: BorderRadius.circular(6)
            ),
          ),
        )
      ],
    );
  }
}
