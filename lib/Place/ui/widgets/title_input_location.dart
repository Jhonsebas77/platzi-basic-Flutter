import 'package:flutter/material.dart';

class TitleInputLocation extends StatelessWidget {
  final String hintTex;
  final TextEditingController controller;
  final IconData iconData;

  TitleInputLocation({
    Key key,
    @required this.hintTex,
    @required this.iconData,
    @required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
            hintText: hintTex,
            suffixIcon: Icon(iconData),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
      ),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black38,
          blurRadius: 15,
          offset: Offset(0, 7),
        ),
      ]),
    );
  }
}