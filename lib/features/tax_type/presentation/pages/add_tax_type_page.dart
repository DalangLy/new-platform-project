import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:platform_project_new/features/tax_type/presentation/widgets/add_tax_type_form.dart';
import '../../../../core/core_export.dart';

class AddTaxTypePage extends StatefulWidget {
  const AddTaxTypePage({Key? key}) : super(key: key);

  @override
  State<AddTaxTypePage> createState() => _AddTaxTypePageState();
}

class _AddTaxTypePageState extends State<AddTaxTypePage> {

  final List<ItemGG> _itemGG = [
    ItemGG(text: 'Record 1'),
    ItemGG(text: 'Record 2'),
    ItemGG(text: 'Record 3'),
    ItemGG(text: 'Record 4'),
  ];

  int _lastIndex = 0;

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
          expansionCallback: (index, isExpanded){
            setState(() {
              _itemGG[_lastIndex].isExpanded = isExpanded;
              _itemGG[index].isExpanded = !isExpanded;

              _lastIndex = index;
            });
          },
          children: _itemGG.map<ExpansionPanel>((e) {
            return ExpansionPanel(
              isExpanded: e.isExpanded,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('$e'),
                );
              },
              body: Container(
                height: 200,
                color: Colors.red,
              ),
            );
          }).toList(),
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
