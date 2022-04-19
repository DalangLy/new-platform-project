import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../abstraction/abstraction_export.dart';

part 'get_all_tax_types_event.dart';
part 'get_all_tax_types_state.dart';

class GetAllTaxTypesBloc extends Bloc<GetAllTaxTypesEvent, GetAllTaxTypesState> {
  final IGetUseCase _useCase;
  GetAllTaxTypesBloc(this._useCase) : super(GetAllTaxTypesInitial()) {
    on<GetAllTaxTypesEvent>((event, emit) async{
      if(event is GetAllTaxTypes){
        emit(GetAllTaxTypesInProgress());
        try{
          await Future.delayed(const Duration(seconds: 3));
          final List<ResponseEntity> data = await _useCase();
          emit(GetAllTaxTypesSuccess(data: data));
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
