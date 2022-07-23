import 'package:json_annotation/json_annotation.dart';

// Who Owns It: Red,Blue,Gray,Black
part 'card.g.dart';

@JsonSerializable()
class Card{

  late String Word;
  late String Owner;
  late bool Coverd;
  bool selected = false;

  Card(this.Word,this.Owner,this.Coverd);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);
}