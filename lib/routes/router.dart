import 'package:auto_route/auto_route.dart';
import '../features/dashboard/dashboard_export.dart';
import '../features/home/home_export.dart';
import '../features/login/login_export.dart';
import '../features/register/register_export.dart';
import '../features/tax_type/presentation/pages/tax_type_page.dart';
import '../features/tax_type/tax_type_export.dart';

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
        AutoRoute(
          path: 'tax-type',
          page: TaxTypeWrapperPage,
          children: <AutoRoute>[
            AutoRoute(
              path: '',
              page: TaxTypePage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}