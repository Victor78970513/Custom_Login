import 'package:custom_login/widgets/batman_button.dart';
import 'package:custom_login/widgets/batman_inputs.dart';
import 'package:flutter/material.dart';

class BatmanScreenSignUp extends AnimatedWidget {
  BatmanScreenSignUp(
    Animation animation,
  ) : super(listenable: animation);

  Animation<double> get _animationBatmanSignUp =>
      listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationBatmanSignUp.value,
        child: Transform.translate(
          offset: Offset(0.0, 100 * (1 - _animationBatmanSignUp.value)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('GET ACCESS',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 20),
                const BatmanInput(label: 'FULL NAME'),
                const BatmanInput(label: 'EMAIL ID'),
                const BatmanInput(label: 'PASSWORD', password: true),
                const SizedBox(height: 20),
                BatmanButton(
                  text: 'SIGN UP',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
