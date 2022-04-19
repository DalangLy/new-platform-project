import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/core_export.dart';

class AddTaxPage extends StatelessWidget {
  const AddTaxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DHomeInnerScaffold(
        breadCrumbs: [
          DBreadCrumb(title: 'Tax', onTapped: (){
            AutoRouter.of(context).pop();
          }),
          const DBreadCrumb(title: 'Add'),
        ],
        body: const Center(
          child: Text('Add Tax Page'),
        )
    );
  }
}
