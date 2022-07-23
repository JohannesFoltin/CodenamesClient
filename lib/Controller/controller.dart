import 'dart:convert';

import 'package:codenames_client/Models/card.dart';
import 'package:codenames_client/Models/game.dart';
import 'package:flutter/widgets.dart';
import 'package:restart_app/restart_app.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Controller extends ChangeNotifier {
  late Game game;
  late final WebSocketChannel channel;
  String spielerName = "";
  String spielerRole = "";

  Controller() {
    game = Game("", 0, false, "", "", [], []);
  }

  void update() {
    channel.stream.listen((data) {
      if (data[0] == '{') {
        game = Game.fromJson(jsonDecode(data));
        notifyListeners();
      } else {}
    }, onError: (error) => {print(error)}, onDone: () => Restart.restartApp());
  }

  void selectAllCards(){
    for(int i = 0;i < game.Cards.length;i++){
      game.Cards[i].selected = !game.Cards[i].selected;
    }
  }

  String cardSelectedFrom(String name) {
    String tmpString = "";
    for (int i = 0; i < game.Users.length; i++) {
      if (game.Users[i].Selected == name) {
        tmpString = "$tmpString${game.Users[i].Name} ";
      }
    }
    return tmpString;
  }

  void sendCardSelection(Card card) {
    String name = card.Word;
    channel.sink.add("{\"Goal\":\"Select\",\"ParamOne\":\"$name\"}");
  }

  void sendUserVeri(String name, String role, String ip) {
    channel = WebSocketChannel.connect(
      Uri.parse('ws://$ip:8080/ws'),
    );
    spielerName = name;
    spielerRole = role;
    String tmpString = "{\"name\":\"$name\",\"typ\": \"$role\"}";
    update();
    channel.sink.add(tmpString);
  }

  void disconnect() {
    channel.sink.close();
  }
}
