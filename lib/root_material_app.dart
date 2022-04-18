import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:platform_project_new/features/start_up_loading/presentation/pages/page_export.dart';
import 'package:platform_project_new/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootMaterialApp extends StatefulWidget {
  const RootMaterialApp({Key? key}) : super(key: key);

  @override
  State<RootMaterialApp> createState() => _RootMaterialAppState();
}

class _RootMaterialAppState extends State<RootMaterialApp> {

  final AppRouter _appRouter = AppRouter();

  bool _isAuth = false;
  bool _showRegisterPage = false;
  bool _isStartUpLoaded = false;

  @override
  Widget build(BuildContext context) {
    return CustomMaterial(
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (_) => [
          // if the user is logged in, they may proceed to the main App
          if (_isAuth)
            HomeWrapperRoute(
                onLogoutResult: (){
                  setState(() {
                    _isAuth = false;
                  });
                }
            )
          else if(_showRegisterPage)
            RegisterRoute(
              onRegisterSuccess: (){
                setState(() {
                  _showRegisterPage = false;
                  _isAuth = true;
                });
              },
              backToLoginTapped: () {
                setState(() {
                  _showRegisterPage = false;
                  _isAuth = false;
                });
              }
            )
          // if they are not logged in, bring them to the Login page
          else
            LoginRoute(
                onLoginResult: (isLoggedIn){
                  setState(() {
                    _isAuth = isLoggedIn;
                  });
                },
                onRegisterTapped: (){
                  setState(() {
                    _showRegisterPage = true;
                  });
                }
            ),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (BuildContext context, Widget? child) {
        if(child == null){
          return const Scaffold();
        }
        else if(_isStartUpLoaded){
          return child;
        }
        else{
          return StartUpLoadingPage(
            onLoadingResult: (){
              setState(() {
                _isStartUpLoaded = true;
              });
            }
          );
        }
      },
    );
  }
}



class CustomMaterial extends StatefulWidget {
  final RouterDelegate<Object> routerDelegate;
  final RouteInformationParser<Object> routeInformationParser;
  final Widget Function(BuildContext, Widget?)? builder;
  const CustomMaterial({Key? key, required this.routerDelegate, required this.routeInformationParser, required this.builder,}) : super(key: key);

  static _CustomMaterialState? of(BuildContext context){
    return context.findAncestorStateOfType<_CustomMaterialState>();
  }
  @override
  State<CustomMaterial> createState() => _CustomMaterialState();
}

class _CustomMaterialState extends State<CustomMaterial> {
  ThemeMode? _themeMode = ThemeMode.system;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      routerDelegate: widget.routerDelegate,
      routeInformationParser: widget.routeInformationParser,
      builder: widget.builder,
    );
  }

  Future<void> loadTheme() async{
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await _prefs;
    final int themeModeIndex = prefs.getInt('themeMode') ?? 0;
    switch(themeModeIndex){
      case 0:
        changeTheme(themeMode: ThemeMode.system);
        break;
      case 1:
        changeTheme(themeMode: ThemeMode.light);
        break;
      case 2:
        changeTheme(themeMode: ThemeMode.dark);
        break;
    }
  }

  Future<void> changeTheme({required ThemeMode themeMode}) async{
    switch(themeMode){
      case ThemeMode.system:
        await _saveTheme(0);
        break;
      case ThemeMode.light:
        await _saveTheme(1);
        break;
      case ThemeMode.dark:
        await _saveTheme(2);
        break;
    }

    setState(() {
      _themeMode = themeMode;
    });
  }

  Future<void> _saveTheme(int index) async{
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('themeMode', index);
  }
}

