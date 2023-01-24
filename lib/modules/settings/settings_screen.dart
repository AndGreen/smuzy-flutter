import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smuzy_flutter/common/theme/fonts.dart';

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
            // title: const Text('Data'),
            tiles: <SettingsTile>[
              SettingsTile(
                // leading: const Icon(Icons.arrow_upward),
                onPressed: (context) {
                  // context.read<UserState>().saveDataToFile();
                },
                title: const Text('Backup to file'),
              ),
              SettingsTile(
                // leading: const Icon(Icons.arrow_downward),
                onPressed: (context) async {
                  // var res = await context
                  //     .read<UserState>()
                  //     .restoreDataFromFile(context);

                  // if (!mounted) return;
                  // if (res != null) {
                  //   if (res) {
                  //     showBottomNotification(
                  //       context: context,
                  //       message: "Backup restored",
                  //       isSuccess: true,
                  //     );
                  //   } else {
                  //     showBottomNotification(
                  //       context: context,
                  //       message: "Not corrected backup file",
                  //       isSuccess: false,
                  //     );
                  //   }
                  // }
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
