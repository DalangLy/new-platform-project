import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/core_export.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()){
    on<LogoutEvent>((event, emit) async{
      if(event is Logout){
        emit(LogoutInProgress());
        try{
         // await _useCase(loginData: event.loginData);
          emit(LogoutSuccess());
        }on Failure catch(e){
          emit(LogoutFailed(message: e.message));
        }
        catch(e){
          emit(LogoutFailed(message: e.toString()));
        }
      }
    });
  }

  void logout(){
    add(Logout());
  }
}
