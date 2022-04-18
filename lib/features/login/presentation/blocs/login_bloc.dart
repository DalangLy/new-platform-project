import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/core_export.dart';
import '../../domain/entities/login_data.dart';
import '../../domain/use_cases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _useCase;
  LoginBloc(this._useCase,) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      if(event is Login){
        emit(LoginInProgress());
        try{
          await _useCase(loginData: event.loginData);
          emit(LoginSuccess());
        }on Failure catch(e){
          emit(LoginFailed(message: e.message));
        }
        catch(e){
          emit(LoginFailed(message: e.toString()));
        }
      }
    });
  }

  void login({required LoginData loginData}){
    add(Login(loginData: loginData));
  }
}
