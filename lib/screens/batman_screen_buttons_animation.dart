import 'package:custom_login/widgets/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanScreenButtons extends AnimatedWidget {
  BatmanScreenButtons(
    Animation animation,
    this.onTap,
  ) : super(listenable: animation);

  Animation<double> get _animationButtonsIn => listenable as Animation<double>;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(0.0, 100 * (1 - _animationButtonsIn.value)),
          child: Column(
            children: [
              BatmanButton(
                text: 'LOGIN',
                left: false,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              BatmanButton(
                text: 'SIGN UP',
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
