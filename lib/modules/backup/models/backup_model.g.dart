// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackupData _$BackupDataFromJson(Map<String, dynamic> json) => BackupData(
      history: (json['history'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String?),
      ),
      routines: (json['routines'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Routine.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$BackupDataToJson(BackupData instance) =>
    <String, dynamic>{
      'history': instance.history.map((k, e) => MapEntry(k.toString(), e)),
      'routines': instance.routines.map((k, e) => MapEntry(k, e.toJson())),
    };
