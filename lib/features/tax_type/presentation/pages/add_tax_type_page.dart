import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:platform_project_new/features/tax_type/presentation/widgets/add_tax_type_form.dart';
import '../../../../core/core_export.dart';

class AddTaxTypePage extends StatelessWidget {
  const AddTaxTypePage({Key? key}) : super(key: key);
  static List<ItemGG> _itemGG = [
    ItemGG(text: 'Record 1'),
    ItemGG(text: 'Record 2'),
    ItemGG(text: 'Record 3'),
    ItemGG(text: 'Record 4'),
  ];
  @override
  Widget build(BuildContext context) {
    return DHomeInnerScaffold(
      breadCrumbs: [
        DBreadCrumb(title: 'Tax Type', onTapped: (){
          AutoRouter.of(context).pop();
        }),
        const DBreadCrumb(title: 'Add',),
      ],
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: [
            ExpansionPanel(
              isExpanded: true,
              headerBuilder: (context, isExpanded) {
                return const ListTile(
                  title: Text('Record 1'),
                );
              },
              body: Container(
                height: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemGG{
  bool isExpanded = false;
  final String text;
  ItemGG({required this.text});
}
