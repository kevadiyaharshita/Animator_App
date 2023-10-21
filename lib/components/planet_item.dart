import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PlanetItem extends StatelessWidget {
  final String image;
  const PlanetItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: white.withOpacity(0.1),
            offset: const Offset(0, -10),
            blurStyle: BlurStyle.inner,
            spreadRadius: 5,
            blurRadius: 1,
          ),
        ],
      ),
      child: Transform.scale(
        scale: 1.3,
        child: AnimatedContainer(
          width: 620,
          height: 620,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
