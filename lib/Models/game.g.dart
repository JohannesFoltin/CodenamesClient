// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      json['Code'] as String,
      json['Picks'] as int,
      json['CurrentTeam'] as bool,
      json['WinCase'] as String,
      json['WinReason'] as String,
      (json['Cards'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'Code': instance.Code,
      'Picks': instance.Picks,
      'CurrentTeam': instance.CurrentTeam,
      'WinCase': instance.WinCase,
      'WinReason': instance.WinReason,
      'Cards': instance.Cards,
      'Users': instance.Users,
    };
