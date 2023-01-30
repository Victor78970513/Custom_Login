import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:google_fonts/google_fonts.dart';

const _imageColor = Color(0xFFC8B853);

class BatmanButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool left;

  const BatmanButton({
    super.key,
    this.onTap,
    required this.text,
    this.left = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(15),
        color: Color(0xFFFDE86A),
        child: Stack(
          children: [
            if (left)
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(-30.0)
                  ..rotateZ(vector.radians(45)),
                child: Image.asset(
                  'assets/batman_logo.png',
                  height: 40,
                  color: _imageColor,
                ),
              ),
            Center(
              child: Text(
                text,
                style: GoogleFonts.vidaloka(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
