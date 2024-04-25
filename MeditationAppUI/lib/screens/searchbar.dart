import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class searchbar extends StatelessWidget {
  const searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29.5)),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            icon: Icon(
              Icons.search,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
