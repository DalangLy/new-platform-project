import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_project_new/features/home/home_export.dart';
import 'package:platform_project_new/features/tax_type/presentation/blocs/get/get_all_tax_types_bloc.dart';

class TaxTypePage extends StatefulWidget {
  const TaxTypePage({Key? key}) : super(key: key);

  @override
  State<TaxTypePage> createState() => _TaxTypePageState();
}

class _TaxTypePageState extends State<TaxTypePage> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllTaxTypesBloc>(context).loadAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllTaxTypesBloc, GetAllTaxTypesState>(
      listener: (context, state) {
        if(state is GetAllTaxTypesFailed){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          HomeWrapperPage.of(context)!.logout(context);
        }
        else if(state is GetAllTaxTypesSuccess){
          print(state.data.length);
        }
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
          );
        },
      ),
    );
  }
}
