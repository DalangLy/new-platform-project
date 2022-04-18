import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_project_new/features/tax_type/domain/use_cases/get_all_tax_types_use_case.dart';

import '../../../../../core/core_export.dart';

part 'get_all_tax_types_event.dart';
part 'get_all_tax_types_state.dart';

class GetAllTaxTypesBloc extends Bloc<GetAllTaxTypesEvent, GetAllTaxTypesState> {
  final GetAllTaxTypesUseCase _useCase;
  GetAllTaxTypesBloc(this._useCase) : super(GetAllTaxTypesInitial()) {
    on<GetAllTaxTypesEvent>((event, emit) async{
      if(event is GetAllTaxTypes){
        emit(GetAllTaxTypesInProgress());
        try{
          await Future.delayed(const Duration(seconds: 3));
          await _useCase();
          emit(GetAllTaxTypesSuccess());
        }on Failure catch(e){
          emit(GetAllTaxTypesFailed(message: e.message));
        }
        catch(e){
          emit(GetAllTaxTypesFailed(message: e.toString()));
        }
      }
    });
  }

  void loadAll(){
    add(GetAllTaxTypes());
  }
}
