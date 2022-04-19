import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_project_new/core/core_export.dart';
import 'package:platform_project_new/core/widgets/d_paginated_data_table.dart';
import 'package:platform_project_new/features/home/home_export.dart';
import 'package:platform_project_new/features/tax_type/domain/domain_export.dart';
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

    BlocProvider.of<GetAllTaxTypesBloc>(context).loadIfNotExisted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllTaxTypesBloc, GetAllTaxTypesState>(
      listener: (context, state) {
        if (state is GetAllTaxTypesFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)));
          HomeWrapperPage.of(context)!.logout(context);
        }
        else if (state is GetAllTaxTypesSuccess) {
          print(state.data.length);
        }
      },
      child: DHomeInnerScaffold(
        breadCrumbs: const [
          DBreadCrumb(title: 'Tax Type',),
        ],
        onAddTapped: (){},
        body: BlocBuilder<GetAllTaxTypesBloc, GetAllTaxTypesState>(
          builder: (context, state) {
            if(state is GetAllTaxTypesSuccess){
              return DPaginatedDataTable(
                headers: const ['ID', 'Code'],
                itemCount: state.data.length,
                valueBuilder: (index){
                  final TaxType taxType = state.data[index] as TaxType;
                  return [
                    Text(taxType.id),
                    Text(taxType.code),
                  ];
                },
                onRowSelect: (index){
                  print(index);
                },
                onDeleteTapped: (index){
                  print('delete $index');
                },
                onEditTapped: (index){
                  print('edit $index');
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
