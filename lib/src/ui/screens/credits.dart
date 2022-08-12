import 'package:beer_distribution_game/src/ui/screens/base.dart';
import 'package:beer_distribution_game/src/ui/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context)!;
    return BaseScreen(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFe8e9eb),
              Color(0xFFc5cad6),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 10),
              child: Text(
                translate.home_credits,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Text(
              '${translate.credits_made_by}:',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Freek van de Ven',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.purpleAccent,
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    translate.home_back,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
