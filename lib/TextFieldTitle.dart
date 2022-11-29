import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitle extends StatelessWidget {
  final TextEditingController controller;

  const TextTitle({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        controller: controller,
        style: GoogleFonts.getFont('Inter'),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Tiêu đề',
            contentPadding: EdgeInsets.only(left: 10.0)),
      ),
    );
  }
}

class TextTitle2 extends StatelessWidget {
  final TextEditingController controller;
  bool? isPassword = false;

  TextTitle2({required this.controller, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        controller: controller,
        style: GoogleFonts.getFont('Inter'),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Tiêu đề',
            contentPadding: EdgeInsets.only(left: 10.0)),
      ),
    );
  }
}

class TextTitle3 extends StatelessWidget {
  bool? isPassword = false;

  TextTitle3({this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        style: GoogleFonts.getFont('Inter'),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Task3',
            contentPadding: EdgeInsets.only(left: 10.0)),
      ),
    );
  }
}
