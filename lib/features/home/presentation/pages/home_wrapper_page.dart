import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_project_new/routes/router.gr.dart';

import '../blocs/logout/logout_bloc.dart';
import '../widgets/animated_menu_icon.dart';
import '../widgets/custom_home_scaffold.dart';
import '../widgets/main_end_drawer.dart';
import '../widgets/main_navigation.dart';

class HomeWrapperPage extends StatefulWidget {
  final VoidCallback onLogoutResult;

  const HomeWrapperPage({Key? key, required this.onLogoutResult,})
      : super(key: key);

  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  final List<MainNavigationItem> _navigationItems = const <MainNavigationItem>[
    MainNavigationItem(title: 'Dashboard', iconData: Icons.speed, route: DashboardWrapperRoute(), path: '',),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(),
      child: Builder(
          builder: (context) {
            return BlocListener<LogoutBloc, LogoutState>(
              listener: (context, state) {
                if(state is LogoutSuccess){
                  widget.onLogoutResult();
                }
              },
              child: CustomHomeScaffold(
                appBar: AppBar(
                  leading: _toggleDrawerButton(),
                  backgroundColor: Colors.grey,
                ),
                drawer: MainNavigation(
                  navigationItems: _navigationItems,
                ),
                endDrawer: const MainEndDrawer(),
                body: const AutoRouter(),
              ),
            );
          }
      ),
    );
  }

  Widget _toggleDrawerButton(){
    return Builder(
      builder: (context) {
        return AnimatedMenuIcon(
          onPressed: () => CustomHomeScaffold.of(context).toggleDrawer(),
        );
      }
    );
  }
}
