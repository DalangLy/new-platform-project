import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/logout/logout_bloc.dart';

class EndDrawerHome extends StatelessWidget {
  const EndDrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: (){
            Navigator.of(context).pushNamed('/end-drawer-theme');
          },
          leading: const Icon(Icons.format_color_fill),
          title: const Text('Theme'),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: (){
            Navigator.of(context).pushNamed('/end-drawer-language');
          },
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: const Icon(Icons.chevron_right),
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
    );
  }
}
