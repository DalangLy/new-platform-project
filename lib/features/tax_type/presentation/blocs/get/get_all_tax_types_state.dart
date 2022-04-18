part of 'get_all_tax_types_bloc.dart';

abstract class GetAllTaxTypesState extends Equatable {
  const GetAllTaxTypesState();
}

class GetAllTaxTypesInitial extends GetAllTaxTypesState {
  @override
  List<Object> get props => [];
}

class GetAllTaxTypesInProgress extends GetAllTaxTypesState {
  @override
  List<Object> get props => [];
}

class GetAllTaxTypesSuccess extends GetAllTaxTypesState {
  final List<ResponseEntity> data;
  const GetAllTaxTypesSuccess({required this.data});
  @override
  List<Object> get props => [];
}

class GetAllTaxTypesFailed extends GetAllTaxTypesState {
  final String message;
  const GetAllTaxTypesFailed({required this.message});
  @override
  List<Object> get props => [];
}
