import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/core_export.dart';

class TaxPage extends StatelessWidget {
  const TaxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DHomeInnerScaffold(
      breadCrumbs: const [
        DBreadCrumb(title: 'Tax',),
      ],
      onAddTapped: (){
        AutoRouter.of(context).pushNamed('add');
      },
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tax Page'),
            ElevatedButton(onPressed: (){
              AutoRouter.of(context).pushNamed('tax-type/add');
            }, child: const Text('Goto Add Tax Type Page')),
          ],
        ),
      )
    );
  }
}
