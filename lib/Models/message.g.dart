// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['Goal'] as String,
      json['ParamOne'] as String,
      json['ParamTwo'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'Goal': instance.Goal,
      'ParamOne': instance.ParamOne,
      'ParamTwo': instance.ParamTwo,
    };
