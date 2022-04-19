import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_export.dart';
import '../../../../routes/router.gr.dart';
import '../../../tax_type/tax_type_export.dart';
import '../blocs/logout/logout_bloc.dart';
import '../widgets/animated_menu_icon.dart';
import '../widgets/custom_home_scaffold.dart';
import '../widgets/main_end_drawer.dart';
import '../widgets/main_navigation.dart';

class HomeWrapperPage extends StatefulWidget {
  final VoidCallback onLogoutResult;

  const HomeWrapperPage({Key? key, required this.onLogoutResult,})
      : super(key: key);

  static _HomeWrapperPageState? of(BuildContext context){
    return context.findAncestorStateOfType<_HomeWrapperPageState>();
  }
  @override
  State<HomeWrapperPage> createState() => _HomeWrapperPageState();
}

class _HomeWrapperPageState extends State<HomeWrapperPage> {
  final List<MainNavigationItem> _navigationItems = const <MainNavigationItem>[
    MainNavigationItem(title: 'Dashboard', iconData: Icons.speed, route: DashboardWrapperRoute(), path: '',),
    MainNavigationItem(title: 'Tax Type', iconData: Icons.speed, route: TaxTypeWrapperRoute(), path: 'tax-type',),
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
                body: HomeMultiBlocProviders(
                  child: const AutoRouter(),
                ),
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

  void logout(BuildContext context){
    BlocProvider.of<LogoutBloc>(context).logout();
  }
}


// Add Get All Blocs As Global Home BlocProvider to keep all data alive while switching to other page
class HomeMultiBlocProviders extends MultiBlocProvider{
  HomeMultiBlocProviders({Key? key, required Widget child}) : super(key: key, providers: [
    BlocProvider(create: (context) => GetAllTaxTypesBloc(GetAllTaxTypesUseCase(TaxTypeRepository(TaxTypeRemoteDataSource(getIt())))),),
  ], child: child);
}