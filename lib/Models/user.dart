import 'package:json_annotation/json_annotation.dart';

//Typen: GCB,GCR,AgentB,AgentR
part 'user.g.dart';
@JsonSerializable()
class User {
  late String Name;
  late String Typ;
  late String Selected;
  User(this.Name,this.Typ,this.Selected);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}