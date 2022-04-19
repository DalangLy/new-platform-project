import 'package:flutter/material.dart';
import '../../../../../app_export.dart';

class EndDrawerTheme extends StatelessWidget {
  const EndDrawerTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: ListView(
        children: [
        ListTile(
            leading: const Icon(Icons.monitor),
            title: const Text('System'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.dark);
            },
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: const Text('Light'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.light);
            },
          ),
        ],
      ),
    );
  }
}
