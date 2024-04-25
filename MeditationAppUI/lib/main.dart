import 'package:apniapp/constraints.dart';
import 'package:apniapp/screens/details_screen.dart';
import 'package:apniapp/screens/searchbar.dart';
import 'package:apniapp/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(apniapp());

class apniapp extends StatelessWidget {
  const apniapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meditation App",
      theme: ThemeData(
          fontFamily: "Cairo", scaffoldBackgroundColor: kBackgroundColor),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and width of our device
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationBar(
              title: "Videos",
              svgScr: "assets/icons/calendar.svg",
            ),
            BottomNavigationBar(
              title: "Home",
              svgScr: "assets/icons/gym.svg",
              isActive: true,
            ),
            BottomNavigationBar(
              title: "Reels",
              svgScr: "assets/icons/sSettings.svg",
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          //Here is the height of the container is 45% of our total height

          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color(0xFFF5CEBB),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image:
                        AssetImage("assets/images/undraw_pilates_gpdb.png"))),
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                              color: Color(0xFFF2BEA1), shape: BoxShape.circle),
                          child: Icon(Icons.menu, color: Colors.white),
                          // ,
                        )),
                    Text(
                      "Good Morning \n Sachin",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    searchbar(),
                    Expanded(
                        child: GridView.count(
                      childAspectRatio: .85,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25,
                      children: <Widget>[
                        CategoryCard(
                          title: "College Videos",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsScreen();
                            }));
                          },
                        ),
                        CategoryCard(
                          title: "Podcasts",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Python",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Animated Contect",
                          svgSrc: "assets/icons/gym.svg",
                          press: () {},
                        )
                      ],
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final String svgScr;
  final String title;
  final String? press;
  final bool isActive;
  const BottomNavigationBar({
    Key? key,
    required this.title,
    required this.svgScr,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/icons/calendar.svg'),
          Text(title,
              style:
                  TextStyle(color: isActive ? kActiveIconColor : kTextColor)),
        ],
      ),
    );
  }
}
