import 'dart:js';

import 'package:apniapp/constraints.dart';
import 'package:apniapp/screens/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: kBlueColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/meditation_bg.png'),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * .05,
                ),
                Text(
                  "Meditation",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Text(
                  "3-10 MIC Course",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .6,
                  child: Text(
                      "It just for breathing purpose and help to maintain body posture"),
                ),
                SizedBox(width: size.width * .5, child: searchbar()),
                Wrap(spacing: 20, runSpacing: 20, children: <Widget>[
                  seassioncard(
                    seassionNum: 1,
                    isDone: true,
                    press: () {},
                  ),
                  seassioncard(
                    seassionNum: 2,
                    isDone: false,
                    press: () {},
                  ),
                  seassioncard(
                    seassionNum: 3,
                    isDone: false,
                    press: () {},
                  ),
                  seassioncard(
                    seassionNum: 4,
                    isDone: false,
                    press: () {},
                  ),
                  seassioncard(
                    seassionNum: 5,
                    isDone: false,
                    press: () {},
                  ),
                  seassioncard(
                    seassionNum: 6,
                    isDone: false,
                    press: () {},
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Text("Meditation ",
                    style: Theme.of(context)!
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class seassioncard extends StatelessWidget {
  final int? seassionNum;
  final bool isDone;
  final void Function() press;

  const seassioncard({
    Key? key,
    this.seassionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, //constraint.maxWidth provide us available width for this
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor)
              ]),

          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor)),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Season $seassionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
