import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_project_new/core/core_export.dart';
import 'package:platform_project_new/features/tax_type/data/data_export.dart';
import 'package:platform_project_new/features/tax_type/domain/use_cases/get_all_tax_types_use_case.dart';
import 'package:platform_project_new/features/tax_type/presentation/blocs/get/get_all_tax_types_bloc.dart';

class TaxTypeWrapperPage extends StatelessWidget {
  const TaxTypeWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetAllTaxTypesBloc(GetAllTaxTypesUseCase(TaxTypeRepository(TaxTypeRemoteDataSource(DHttpClient())))),),
      ],
      child: const AutoRouter(),
    );
  }
}
