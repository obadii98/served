import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:served/signin.dart';
import 'package:served/Resource.dart';


class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}


class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Money Exchange",
        description: "Find people in different countries to exchange money with them and  deliver it where you want, without having to travel.",
        pathImage: "images/Exchange.png",
        backgroundColor: Resource.primaryColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Package Transfer",
        description: "Transfer what you want where you want, by finding people who is traveling and welling to help you.",
        pathImage: "images/Package.png",
        backgroundColor: Colors.blueGrey[300],
      ),
    );
    slides.add(
      new Slide(
        title: "Transport Sharing",
        description:
        "Share a Taxi, Bus, etc... Go to your destination. Reduce your expenses.",
        pathImage: "images/Transport.png",
        backgroundColor: Resource.primaryColor,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}