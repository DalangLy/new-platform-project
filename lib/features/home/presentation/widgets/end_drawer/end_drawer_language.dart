import 'package:flutter/material.dart';
import '../../../../../app_export.dart';

class EndDrawerLanguage extends StatelessWidget {
  const EndDrawerLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('System Language'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('English'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Khmer'),
            onTap: () {
              CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
        ],
      ),
    );
  }
}


