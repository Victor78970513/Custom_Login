import 'package:flutter/material.dart';

class BatmanScreenCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CityClipper(),
      child: Image.asset(
        'assets/city.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class _CityClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
