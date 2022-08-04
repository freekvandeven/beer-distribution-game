import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ApplicationConfigurationService
    extends StateNotifier<ApplicationConfiguration> {
  ApplicationConfigurationService._()
      : super(ApplicationConfiguration(language: 'unknown'));
}

class BeerApplicationConfigurationService
    extends StateNotifier<ApplicationConfiguration>
    implements ApplicationConfigurationService {
  BeerApplicationConfigurationService()
      : super(ApplicationConfiguration(language: 'unknown'));
}
