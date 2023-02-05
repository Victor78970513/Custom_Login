import 'package:flutter/material.dart';

class BatmanInput extends StatelessWidget {
  final String label;
  final bool password;

  const BatmanInput({
    super.key,
    required this.label,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[600]!, width: 1));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(color: Colors.grey[400]),
            enabledBorder: border,
            border: border,
            suffixIcon: password
                ? Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: UnconstrainedBox(
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : null),
      ),
    );
  }
}
