import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // route to introduction screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
        context,
        BeerRoute.introductionScreen.route,
      );
    });
    // splashscreen with custom background and logo
    return BaseScreen(child: Center(child: Text('splashScreen')));
  }
}
