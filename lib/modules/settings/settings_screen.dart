import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smuzy/common/theme/colors.dart';
import 'package:smuzy/common/theme/fonts.dart';
import 'package:smuzy/modules/app/navigation.dart';
import 'package:smuzy/modules/backup/backup_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var backupService = ref.read(backupProvider.notifier);
    var packageInfo = useFuture(PackageInfo.fromPlatform());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: AppFonts.title,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SettingsList(
              darkTheme: SettingsThemeData(
                settingsListBackground: context.colorScheme.surface,
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
                        var isRestored =
                            await backupService.restoreDataFromFile();
                        Future.delayed(Duration.zero, () {
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
                        });
                      },
                      title: const Text('Restore backup'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('Version ${packageInfo.data?.version}')
              .opacity(context.isDarkMode ? 0.1 : 0.5)
              .padding(vertical: 20)
        ],
      ),
    );
  }
}
