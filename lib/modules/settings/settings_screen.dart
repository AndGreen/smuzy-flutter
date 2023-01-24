import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/modules/app/navigation.dart';
import 'package:smuzy_flutter/modules/backup/backup_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: AppFonts.title,
        ),
      ),
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
        ),
        contentPadding: const EdgeInsets.all(0),
        sections: [
          SettingsSection(
            tiles: <SettingsTile>[
              SettingsTile(
                onPressed: (context) {
                  BackupService().saveDataToFile();
                },
                title: const Text('Backup to file'),
              ),
              SettingsTile(
                onPressed: (context) async {
                  var isRestored = await BackupService().restoreDataFromFile();
                  if (isRestored != null && isRestored) {
                    Navigation.showNotification(
                      context: context,
                      message: "Backup restored",
                      isSuccess: true,
                    );
                  } else {
                    Navigation.showNotification(
                      context: context,
                      message: "Backup restore failed",
                      isSuccess: false,
                    );
                  }
                },
                title: const Text('Restore backup'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
