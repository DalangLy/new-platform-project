import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'custom_material_app.dart';
import 'features/start_up_loading/start_up_loading_export.dart';
import 'routes/router.gr.dart';

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
    return CustomMaterialApp(
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

