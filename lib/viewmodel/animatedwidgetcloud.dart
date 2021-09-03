import 'dart:async';

import 'package:challenge_difficulty_scale_mansour/viewmodel/day_night_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Custom Widget To Make Clouds Moving
class AnimatedCloud extends StatefulWidget {
  AnimatedCloud({
    this.hie,
    this.wid,
    this.top,
    this.bottom,
    this.left,
    this.speed,
    this.moveToRight,
  }) {
    moveToRight =
        (moveToRight == null) ? false : moveToRight; //Check if move To Right
  }
  final double? wid, hie, speed, top, bottom, left;
  late bool? moveToRight;

  @override
  _AnimatedCloudState createState() => _AnimatedCloudState(
        wid: wid,
        hie: hie,
        speed: speed,
        left: left,
        top: top,
        bottom: bottom,
        moveToRight: moveToRight,
      );
}

class _AnimatedCloudState extends State<AnimatedCloud> {
  _AnimatedCloudState({
    this.hie,
    this.wid,
    this.top,
    this.bottom,
    this.left,
    this.speed,
    this.moveToRight,
  });
  double? wid, hie, speed, top, bottom, left;

  final bool? moveToRight; //to make cloud move to right
  bool reverse = false; //to make cloud repeat move from starting direction

  void runLeftClouds(double width, double speed) {
    //to make cloud run to left
    //
    setState(() {
      left = left! - speed;
      if (left! < (-134 - speed)) {
        //chek if cloud is out of borders from left side
        left = width - width + 365; //start point in left side
        reverse = !reverse; //repeat moving from start point
      } else {
        reverse = false;
      }
    });
  }

  void runRightClouds(double width, double speed) {
    //to Make Cloud run to right
    setState(() {
      left = left! + speed;
      if (left! > (width + 400)) {
        //chek if cloud is out of borders from Right side
        left = -139; //start point on right side
        reverse = !reverse; //repeat moving from start point
      } else {
        reverse = false;
      }
    });
  }

  late Timer tim;

  @override
  void initState() {
    tim = Timer.periodic(Duration(seconds: 2), (timer) {
      //timer to make clouds keep moving
      if (moveToRight!)
        //move to right
        runRightClouds(wid!, speed!);
      else
        //move to left
        runLeftClouds(wid!, speed!);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var img = AssetImage(Provider.of<DayNightProvider>(context).isNight
        ? 'assets/img/cloud.png'
        : 'assets/img/cloud2.png'); //from provider get isNight value to change image

    return AnimatedPositioned(
      duration: Duration(milliseconds: 1998),
      top: top,
      bottom: bottom,
      left: left,
      child:
          reverse //check if reverse to hide widget during repeat last move from start point
              ? Text(
                  '') //if you remove this condition you can see cloud during back to start point

              : Container(
                  width: wid,
                  height: hie,
                  child: Image(
                    image: img,
                  ),
                ),
    );
  }
}
