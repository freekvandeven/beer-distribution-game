import 'dart:math';

import 'package:beer_distribution_game/src/models/models.dart';

abstract class GameLogicService {
  BeerGame processRound(BeerGame game, List<Move> moves);
  BeerGame initializeInventories(BeerGame game);
  bool checkMove(Move move);
}

class MitGameRulesLogicService implements GameLogicService {
  static const int inventoryMax = 10;
  static const int inventoryMin = 1;
  late Random random;

  @override
  BeerGame processRound(BeerGame game, List<Move> moves) {
    var updatedPlayers = <Player>[...game.players];
    // transfer everything from transit to the inventory
    updatedPlayers = updatedPlayers
        .map(
          (player) => player.copyWith(
            inventory: player.inventory.copyWith(
              transit: 0,
              amount: player.inventory.amount + player.inventory.transit,
            ),
          ),
        )
        .toList();

    // process the moves
    for (var move in moves) {
      var totalDelivered = 0;
      for (var delivery in move.delivers.entries) {
        // update the transit amount of the receiving player
        updatedPlayers[delivery.key] = updatedPlayers[delivery.key].copyWith(
          inventory: updatedPlayers[delivery.key].inventory.copyWith(
                transit: updatedPlayers[delivery.key].inventory.transit +
                    delivery.value,
              ),
        );
        // update the backlog of the sending player
        updatedPlayers[move.sender] = updatedPlayers[move.sender].copyWith(
          backlog: {
            ...updatedPlayers[move.sender].backlog,
            delivery.key: updatedPlayers[move.sender].backlog[delivery.key]! -
                delivery.value,
          },
        );
        totalDelivered += delivery.value;
      }

      // update the inventory of the sending player
      updatedPlayers[move.sender] = updatedPlayers[move.sender].copyWith(
        inventory: updatedPlayers[move.sender].inventory.copyWith(
              amount:
                  updatedPlayers[move.sender].inventory.amount - totalDelivered,
            ),
      );

      for (var order in move.orders.entries) {
        // update the backlog of the receiving player that needs to deliver
        updatedPlayers[order.key] = updatedPlayers[order.key].copyWith(
          backlog: {
            ...updatedPlayers[order.key].backlog,
            move.sender:
                updatedPlayers[order.key].backlog[move.sender]! + order.value,
          },
        );
      }
    }

    var newMoves = [...game.moves, ...moves];
    return game.copyWith(
      moves: newMoves,
      players: updatedPlayers,
      currentRound: game.currentRound + 1,
    );
  }

  @override
  BeerGame initializeInventories(BeerGame game) {
    var players = game.players;
    var randomSeed = game.config.gameSeed;
    random = Random(randomSeed);
    var updatedPlayers = <Player>[];
    for (var player in players) {
      var randomInventory = random.nextInt(inventoryMax - inventoryMin) +
          inventoryMin; // random number between inventoryMin and inventoryMax
      var updatedPlayer = player.copyWith(
        inventory: PlayerInventory(
          amount: randomInventory,
          transit: 0,
        ),
      );
      updatedPlayers.add(updatedPlayer);
    }
    return game.copyWith(players: updatedPlayers, currentRound: 1);
  }

  @override
  bool checkMove(Move move) {
    // TODO(freek): check if there is a corresponding order and enough inventory
    return true;
  }
}
