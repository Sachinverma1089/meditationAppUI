import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constraints.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final void Function()? press;

  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor)
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(svgSrc),
              Spacer(),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
