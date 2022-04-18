import 'package:auto_route/auto_route.dart';
import '../features/home/home_export.dart';
import '../features/login/login_export.dart';
import '../features/register/register_export.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/register',
      page: RegisterPage,
    ),
    AutoRoute(
      path: '/',
      page: HomeWrapperPage,
    ),
  ],
)
class $AppRouter {}