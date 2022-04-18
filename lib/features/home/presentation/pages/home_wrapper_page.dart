import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/logout/logout_bloc.dart';

class HomeWrapperPage extends StatelessWidget {
  final VoidCallback onLogoutResult;

  const HomeWrapperPage({Key? key, required this.onLogoutResult,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(),
      child: Builder(
          builder: (context) {
            return BlocListener<LogoutBloc, LogoutState>(
              listener: (context, state) {
                if(state is LogoutSuccess){
                  onLogoutResult();
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Home Page'),
                  actions: [
                    IconButton(onPressed: (){
                      BlocProvider.of<LogoutBloc>(context).logout();
                    }, icon: const Icon(Icons.logout)),
                  ],
                ),
                body: const SafeArea(
                  child: Center(
                    child: Text('Home Page'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
