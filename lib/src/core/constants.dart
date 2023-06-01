import 'package:flutter/material.dart';

const kInputHeight = 50.0;
const kBorderRadius = 20.0;
const kLeftBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  bottomLeft: Radius.circular(20.0),
);
const kRightBorderRadius = BorderRadius.only(
  topRight: Radius.circular(kBorderRadius),
  bottomRight: Radius.circular(kBorderRadius),
);
const kOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.deepPurple),
  borderRadius: kLeftBorderRadius,
);