import 'package:flutter/material.dart';

Container arrowButton(IconData icons) {
  return Container(
        width: 50,
        height: 100,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Icon(icons),
      );
}