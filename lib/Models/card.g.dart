// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      json['Word'] as String,
      json['Owner'] as String,
      json['Coverd'] as bool,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'Word': instance.Word,
      'Owner': instance.Owner,
      'Coverd': instance.Coverd,
    };
