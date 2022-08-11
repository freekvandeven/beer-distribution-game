import 'package:beer_distribution_game/src/models/models.dart';
import 'package:beer_distribution_game/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('gamelogic service test', () {
    late GameLogicService sut;
    late BeerGame initialGame;

    setUp(() {
      sut = MitGameRulesLogicService();
      initialGame = BeerGame.defaultGame();
    });

    group('initialize first round test', () {
      test('initialize is pseudorandom', () {
        // arrange

        // act
        var result = sut.initializeInventories(initialGame);
        var secondResult = sut.initializeInventories(initialGame);

        // assert
        expect(result.currentRound, 1);
        expect(result, secondResult);
      });
    });
  });
}
