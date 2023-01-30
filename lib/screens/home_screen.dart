import 'package:custom_login/widgets/batman_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class Batman_SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100F0B),
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
            child: Image.asset(
              'assets/batman_alone.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/batman_logo.png',
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'WELCOME TO',
                    // style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: 22,
                    // ),
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'GOTHAM CITY',
                    style:
                        GoogleFonts.vidaloka(color: Colors.white, fontSize: 35),
                  ),
                  Column(
                    children: [
                      BatmanButton(text: 'LOGIN'),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
