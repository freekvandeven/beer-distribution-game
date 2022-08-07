import 'package:beer_distribution_game/src/config/beerroutes.dart';
import 'package:beer_distribution_game/src/providers.dart';
import 'package:flutter/material.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static final Duration _splashDuration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // route to introduction screen after 2 seconds
    Future.delayed(_splashDuration, () {
      if (ref.read(applicationConfigProvider).introductionFinished) {
        Navigator.of(context).pushReplacementNamed(BeerRoute.homeScreen.route);
      } else {
        Navigator.of(context).pushReplacementNamed(
          BeerRoute.introductionScreen.route,
        );
      }
    });
    // splashscreen with custom background and logo
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Center(
        child: Text(
          'Beer distribution game',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
