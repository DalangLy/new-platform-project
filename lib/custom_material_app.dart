import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomMaterialApp extends StatefulWidget {
  final RouterDelegate<Object> routerDelegate;
  final RouteInformationParser<Object> routeInformationParser;
  final Widget Function(BuildContext, Widget?)? builder;
  const CustomMaterialApp({Key? key, required this.routerDelegate, required this.routeInformationParser, required this.builder,}) : super(key: key);

  static _CustomMaterialAppState? of(BuildContext context){
    return context.findAncestorStateOfType<_CustomMaterialAppState>();
  }

  @override
  State<CustomMaterialApp> createState() => _CustomMaterialAppState();
}

class _CustomMaterialAppState extends State<CustomMaterialApp> {
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
