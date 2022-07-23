// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['Name'] as String,
      json['Typ'] as String,
      json['Selected'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Name': instance.Name,
      'Typ': instance.Typ,
      'Selected': instance.Selected,
    };
