import 'package:flutter/material.dart';

class DashboardWrapperPage extends StatelessWidget {
  const DashboardWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dashboard Under Maintaining', style: Theme.of(context).textTheme.headline3,),
    );
  }
}
