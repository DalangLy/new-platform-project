import 'package:auto_route/auto_route.dart';
import 'package:platform_project_new/features/dashboard/dashboard_export.dart';
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
      children: <AutoRoute>[
        AutoRoute(
          path: '',
          page: DashboardWrapperPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}