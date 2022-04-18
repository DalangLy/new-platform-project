import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../root_material_app.dart';
import '../blocs/logout/logout_bloc.dart';

class MainEndDrawer extends StatelessWidget {
  const MainEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 5.0),
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.monitor),
                  title: const Text('System Theme Mode'),
                  onTap: () {
                    CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.system);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Dark Theme Mode'),
                  onTap: () {
                    CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.dark);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.light_mode),
                  title: const Text('Light Theme Mode'),
                  onTap: () {
                    CustomMaterial.of(context)!.changeTheme(themeMode: ThemeMode.light);
                  },
                ),
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
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    BlocProvider.of<LogoutBloc>(context).logout();
                  },
                  trailing: BlocBuilder<LogoutBloc, LogoutState>(
                    builder: (context, state) {
                      if (state is LogoutInProgress) {
                        return const CircularProgressIndicator();
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}