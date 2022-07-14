import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    Key? key,
    required this.text,
    this.textColor = 0xFF38373D,
    required this.fillColor,
    this.textSize = 28.0,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        width: 86.0,
        height: 86.0,
        // ignore: deprecated_member_use
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
          ),
          onPressed: () {
            callback(text);
          },
          // ignore: unnecessary_null_comparison
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}