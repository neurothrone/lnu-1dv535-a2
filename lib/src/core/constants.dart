import 'package:flutter/material.dart';

const kPadding0 = 0.0;
const kPadding10 = 10.0;
const kPadding20 = 20.0;

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

