import 'package:flutter/material.dart';

import '../colors/app_color.dart';

titleStyle() {
  return const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17);
}

titleCapStyle() {
  return const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
}

titleGreenStyle() {
  return const TextStyle(
      color: AppColor.kGreenColor, fontWeight: FontWeight.bold, fontSize: 18);
}

titleBlackStyle() {
  return const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
}

subtitleStyle() {
  return const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14);
}

subtitleBlackStyle() {
  return const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 14,
    letterSpacing: 2,
  );
}

miniStyle() {
  return const TextStyle(color: Colors.white, fontSize: 12);
}
