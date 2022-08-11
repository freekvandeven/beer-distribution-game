import 'package:equatable/equatable.dart';

enum NodeType { fabricator, supplier, distributor, retailer, consumer }

class PlayerNode extends Equatable {
  const PlayerNode({
    required this.type,
    required this.defaultAgentName,
    required this.deliversTo,
    required this.receivesFrom,
  });

  factory PlayerNode.fromJson(Map<String, dynamic> json) {
    return PlayerNode(
      type: NodeType.values[json['type'] as int],
      defaultAgentName: json['defaultAgentName'] as String,
      deliversTo: (json['deliversTo'] as List).map((e) => e as int).toList(),
      receivesFrom:
          (json['receivesFrom'] as List).map((e) => e as int).toList(),
    );
  }

  final NodeType type;
  final String defaultAgentName;
  final List<int> deliversTo;
  final List<int> receivesFrom;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        type,
        defaultAgentName,
        deliversTo,
        receivesFrom,
      ];

  Map<String, dynamic> toJson() => {
        'type': type.index,
        'defaultAgentName': defaultAgentName,
        'deliversTo': deliversTo,
        'receivesFrom': receivesFrom,
      };
}
