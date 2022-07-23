// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message{
  late String Goal;
  late String ParamOne;
  late String ParamTwo;

  Message(this.Goal,this.ParamOne,this.ParamTwo);
   factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

}