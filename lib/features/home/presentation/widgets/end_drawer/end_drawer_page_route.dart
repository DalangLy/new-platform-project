import 'package:flutter/material.dart';
import 'package:platform_project_new/features/home/presentation/widgets/end_drawer/end_drawer_theme.dart';

import 'end_drawer_home.dart';
import 'end_drawer_language.dart';

class EndDrawerPageRoute extends StatelessWidget {
  const EndDrawerPageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => const EndDrawerHome();
            break;
          case '/end-drawer-language':
            builder = (BuildContext _) => const EndDrawerLanguage();
            break;
          case '/end-drawer-theme':
            builder = (BuildContext _) => const EndDrawerTheme();
            break;
          // case '/bill':
          //   builder = (BuildContext _) => const BillList();
          //   break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
