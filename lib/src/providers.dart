import 'package:beer_distribution_game/src/models/models.dart';
import 'package:beer_distribution_game/src/services/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* provide implementations of the service interfaces */

final gameProvider = StateNotifierProvider<GameService, BeerGame>(
  (ref) => BeerGameService(),
);

final browserProvider =
    StateNotifierProvider<GameBrowserService, List<GameInfo>>(
  (ref) => BeerGameBrowserService(),
);

final gameConfigProvider =
    StateNotifierProvider<GameConfigService, GameConfiguration>(
  (ref) => BeerGameConfigService(),
);

final applicationConfigProvider = StateNotifierProvider<
    ApplicationConfigurationService, ApplicationConfiguration>(
  (ref) => BeerApplicationConfigurationService(),
);
