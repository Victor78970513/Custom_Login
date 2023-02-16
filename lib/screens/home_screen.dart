import 'package:custom_login/screens/batman_screen_buttons_animation.dart';
import 'package:custom_login/screens/batman_screen_city.dart';
import 'package:custom_login/screens/batman_signup.dart';
import 'package:custom_login/screens/batman_titleScreen.dart';
import 'package:custom_login/widgets/batman_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _batmanVerticalMovement = 60.0;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light().copyWith(
          textTheme: GoogleFonts.vidalokaTextTheme(),
        ),
        child: Batman_SignUp());
  }
}

class Batman_SignUp extends StatefulWidget {
  @override
  State<Batman_SignUp> createState() => _Batman_SignUpState();
}

class _Batman_SignUpState extends State<Batman_SignUp>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  late AnimationController _animationControllerSignUp;
  late Animation<double> _animationLogoOut;
  late Animation<double> _animationBatmanTop;
  late Animation<double> _animationGothamCity;
  late Animation<double> _animationBatmanSignUp;

  void _setUpFirstAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationLogoIn = Tween(begin: 30.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );

    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.decelerate),
      ),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1),
    );

    _animationController.forward();
  }

  void _setUpSecondAnimation() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.0, 0.20),
    );

    _animationBatmanTop = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.35, 0.55),
    );

    _animationGothamCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.65, 0.80),
    );

    _animationBatmanSignUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
    );
  }

  void _onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    _setUpFirstAnimation();
    _setUpSecondAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
          animation: Listenable.merge(
              [_animationController, _animationControllerSignUp]),
          builder: (context, _) {
            return Scaffold(
              backgroundColor: const Color(0xFF100F0B),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/batman_background.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          _batmanVerticalMovement * _animationLogoOut.value -
                              _animationBatmanTop.value *
                                  _batmanVerticalMovement),
                      child: Transform.scale(
                        scale: _animationBatmanIn.value,
                        child: Image.asset(
                          'assets/batman_alone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 5,
                    left: 40,
                    right: 40,
                    child: BatmanScreenCity(_animationGothamCity),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: BatmanScreenSignUp(_animationBatmanSignUp),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(0.0, 60 * _animationLogoOut.value),
                      child: Opacity(
                        opacity: 1 - _animationLogoOut.value,
                        child: Column(
                          children: [
                            BatmanTitleScreen(_animationLogoMovementUp),
                            const SizedBox(height: 35),
                            BatmanScreenButtons(_animationButtonsIn, _onSignUp),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.2 -
                        60 * _animationLogoMovementUp.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: 1 - _animationLogoOut.value,
                      child: Transform.scale(
                        scale: _animationLogoIn.value,
                        child: Image.asset(
                          'assets/batman_logo.png',
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
