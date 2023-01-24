import 'package:json_annotation/json_annotation.dart';
import 'package:smuzy_flutter/modules/routines/models/routine_model.dart';

part 'backup_model.g.dart';

@JsonSerializable()
class BackupData {
  BackupData({
    required this.history,
    required this.routines,
  });

  Map<BlockId, RoutineId?> history;
  @JsonKey(name: 'routines')
  Map<RoutineId, Routine> routines;

  factory BackupData.fromJson(Map<String, dynamic> json) =>
      _$BackupDataFromJson(json);

  Map<String, dynamic> toJson() => _$BackupDataToJson(this);
}
