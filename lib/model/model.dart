import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Model {
  Widget? getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
      );
    } else if (condition < 500) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
      );
    } else if (condition <= 803) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
      );
    }
    return SvgPicture.asset('svg/climacon-sun.svg');
  }

  Widget? getAirIcon(int? index) {
    if (index == 1) {
      return Image.asset(
        'image/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 5) {
      return Image.asset(
        'image/bad.png',
        width: 37.0,
        height: 35.0,
      );
    }
    return Image.asset('image/good.png');
  }

  Widget? getAirIndex(int? index) {
    if (index == 1) {
      return Text(
        "매우 좋음",
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 2) {
      return Text(
        "좋음",
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 3) {
      return Text(
        "보통",
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 4) {
      return Text(
        "나쁨",
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    } else if (index == 5) {
      return Text(
        "매우 나쁨",
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    }
    return Text("측정 불가");
  }
}
