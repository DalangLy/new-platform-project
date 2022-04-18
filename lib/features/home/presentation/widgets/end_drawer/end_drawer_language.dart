import 'package:flutter/material.dart';
import '../../../../../root_material_app.dart';

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
              CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('English'),
            onTap: () {
              CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Khmer'),
            onTap: () {
              CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.system);
            },
          ),
        ],
      ),
    );
  }
}


