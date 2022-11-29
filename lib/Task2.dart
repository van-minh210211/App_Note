import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/gen/assets.gen.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            // controller: controller,
            style: GoogleFonts.getFont('Inter'),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Task2',
                contentPadding: EdgeInsets.only(left: 10.0)),
          ),
        ),
      ],
    );
  }
}
