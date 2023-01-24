import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';
import 'package:smuzy_flutter/modules/app/navigation.dart';
import 'package:smuzy_flutter/modules/backup/backup_provider.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var backupService = ref.read(backupProvider.notifier);

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
                onPressed: (context) async {
                  await backupService.saveDataToFile();
                },
                title: const Text('Backup to file'),
              ),
              SettingsTile(
                onPressed: (context) async {
                  var isRestored = await backupService.restoreDataFromFile();
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
