import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smuzy_flutter/modules/backup/models/backup_model.dart';
import 'package:smuzy_flutter/modules/days/day_provider.dart';
import 'package:smuzy_flutter/modules/days/day_repository.dart';
import 'package:smuzy_flutter/modules/routines/routine_provider.dart';
import 'package:smuzy_flutter/modules/routines/routine_repository.dart';

part 'backup_provider.g.dart';

@riverpod
class Backup extends _$Backup {
  @override
  Backup build() => Backup();

  saveDataToFile() async {
    var routines = RoutinesRepository.getRoutines();
    var history = DaysRepository.getFullHistory();

    Directory documents = await getApplicationDocumentsDirectory();
    File backupFile = File('${documents.path}/backup.json');
    var json = jsonEncode(BackupData(routines: routines, history: history));

    await backupFile.writeAsString(json);
    await Share.shareXFiles([XFile(backupFile.path)]);
  }

  restoreDataFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      try {
        File file = File(result.files.single.path!);
        var json = jsonDecode(await file.readAsString());
        var data = BackupData.fromJson(json);

        ref.read(routinesProvider.notifier).restoreRoutines(data.routines);
        ref.read(dayProvider.notifier).restoreHistory(data.history);

        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
