import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smuzy_flutter/modules/backup/backup_model.dart';
import 'package:smuzy_flutter/modules/days/day_repository.dart';
import 'package:smuzy_flutter/modules/routines/routine_repository.dart';

class BackupService {
  saveDataToFile() async {
    var routines = RoutinesRepository.getRoutines();
    var history = DaysRepository.getAllHistory();

    Directory documents = await getApplicationDocumentsDirectory();
    File backupFile = File('${documents.path}/backup.json');
    var json =
        BackupData(routines: routines, history: history).toJson().toString();
    await backupFile.writeAsString(json);
    await Share.shareFiles([backupFile.path]);
  }

  restoreDataFromFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      try {
        File file = File(result.files.single.path!);
        var json = await file.readAsString();
        // var data = BackupData.fromJson(jsonDecode(json));

        // restore data

        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
