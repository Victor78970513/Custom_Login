import 'package:custom_login/widgets/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanTitleScreen extends AnimatedWidget {
  BatmanTitleScreen(Animation animation) : super(listenable: animation);

  Animation<double> get _animationLogoMovementUp =>
      listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: const [
          Text(
            'WELCOME TO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
