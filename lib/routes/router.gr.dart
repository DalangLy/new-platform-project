// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../features/dashboard/dashboard_export.dart' as _i4;
import '../features/home/home_export.dart' as _i3;
import '../features/login/login_export.dart' as _i1;
import '../features/register/register_export.dart' as _i2;
import '../features/tax_type/presentation/pages/page_export.dart' as _i5;
import '../features/tax_type/presentation/pages/tax_type_page.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.LoginPage(
              key: args.key,
              onLoginResult: args.onLoginResult,
              onRegisterTapped: args.onRegisterTapped));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.RegisterPage(
              key: args.key,
              onRegisterSuccess: args.onRegisterSuccess,
              backToLoginTapped: args.backToLoginTapped));
    },
    HomeWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HomeWrapperRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.HomeWrapperPage(
              key: args.key, onLogoutResult: args.onLogoutResult));
    },
    DashboardWrapperRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardWrapperPage());
    },
    TaxTypeWrapperRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.TaxTypeWrapperPage());
    },
    TaxTypeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.TaxTypePage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LoginRoute.name, path: '/login'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register'),
        _i7.RouteConfig(HomeWrapperRoute.name, path: '/', children: [
          _i7.RouteConfig(DashboardWrapperRoute.name,
              path: '', parent: HomeWrapperRoute.name),
          _i7.RouteConfig(TaxTypeWrapperRoute.name,
              path: 'tax-type',
              parent: HomeWrapperRoute.name,
              children: [
                _i7.RouteConfig(TaxTypeRoute.name,
                    path: '', parent: TaxTypeWrapperRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute(
      {_i8.Key? key,
      required dynamic Function(bool) onLoginResult,
      required void Function() onRegisterTapped})
      : super(LoginRoute.name,
            path: '/login',
            args: LoginRouteArgs(
                key: key,
                onLoginResult: onLoginResult,
                onRegisterTapped: onRegisterTapped));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs(
      {this.key, required this.onLoginResult, required this.onRegisterTapped});

  final _i8.Key? key;

  final dynamic Function(bool) onLoginResult;

  final void Function() onRegisterTapped;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult, onRegisterTapped: $onRegisterTapped}';
  }
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute(
      {_i8.Key? key,
      required void Function() onRegisterSuccess,
      required void Function() backToLoginTapped})
      : super(RegisterRoute.name,
            path: '/register',
            args: RegisterRouteArgs(
                key: key,
                onRegisterSuccess: onRegisterSuccess,
                backToLoginTapped: backToLoginTapped));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs(
      {this.key,
      required this.onRegisterSuccess,
      required this.backToLoginTapped});

  final _i8.Key? key;

  final void Function() onRegisterSuccess;

  final void Function() backToLoginTapped;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, onRegisterSuccess: $onRegisterSuccess, backToLoginTapped: $backToLoginTapped}';
  }
}

/// generated route for
/// [_i3.HomeWrapperPage]
class HomeWrapperRoute extends _i7.PageRouteInfo<HomeWrapperRouteArgs> {
  HomeWrapperRoute(
      {_i8.Key? key,
      required void Function() onLogoutResult,
      List<_i7.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name,
            path: '/',
            args:
                HomeWrapperRouteArgs(key: key, onLogoutResult: onLogoutResult),
            initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

class HomeWrapperRouteArgs {
  const HomeWrapperRouteArgs({this.key, required this.onLogoutResult});

  final _i8.Key? key;

  final void Function() onLogoutResult;

  @override
  String toString() {
    return 'HomeWrapperRouteArgs{key: $key, onLogoutResult: $onLogoutResult}';
  }
}

/// generated route for
/// [_i4.DashboardWrapperPage]
class DashboardWrapperRoute extends _i7.PageRouteInfo<void> {
  const DashboardWrapperRoute() : super(DashboardWrapperRoute.name, path: '');

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i5.TaxTypeWrapperPage]
class TaxTypeWrapperRoute extends _i7.PageRouteInfo<void> {
  const TaxTypeWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(TaxTypeWrapperRoute.name,
            path: 'tax-type', initialChildren: children);

  static const String name = 'TaxTypeWrapperRoute';
}

/// generated route for
/// [_i6.TaxTypePage]
class TaxTypeRoute extends _i7.PageRouteInfo<void> {
  const TaxTypeRoute() : super(TaxTypeRoute.name, path: '');

  static const String name = 'TaxTypeRoute';
}
