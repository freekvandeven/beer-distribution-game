import 'package:beer_distribution_game/src/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AgentStorageService extends StateNotifier<List<Agent>> {
  AgentStorageService._() : super([]);

  Future<void> retrieveAgents();
  Future<void> removeAgent(Agent agent);
  Future<void> updateAgent(Agent agent);
}

class SharedPreferenceAgentStorageService extends StateNotifier<List<Agent>>
    implements AgentStorageService {
  SharedPreferenceAgentStorageService() : super([]);

  @override
  Future<void> removeAgent(Agent agent) async {}

  @override
  Future<void> retrieveAgents() async {}

  @override
  Future<void> updateAgent(Agent agent) async {}
}
