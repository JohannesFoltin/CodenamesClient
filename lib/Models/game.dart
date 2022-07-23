import 'package:codenames_client/Models/card.dart';
import 'package:codenames_client/Models/user.dart';
import 'package:json_annotation/json_annotation.dart';

// Red == false, blue == true
part 'game.g.dart';

@JsonSerializable()
class Game {
  late String Code;
  late int Picks;
  late bool CurrentTeam;
  late String WinCase;
  late String WinReason;
  late List<Card> Cards;
  late List<User> Users;
  Game(this.Code,this.Picks,this.CurrentTeam,this.WinCase,this.WinReason,this.Cards,this.Users);


  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);
}