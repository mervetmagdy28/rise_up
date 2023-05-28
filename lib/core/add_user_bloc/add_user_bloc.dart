import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up/core/add_user_bloc/add_user_state.dart';
import 'package:rise_up/core/utils/api_service.dart';
import 'add_user_event.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {

  final _userStateController = StreamController<AddUserState>.broadcast();

  Stream<AddUserState> get userStateStream => _userStateController.stream;
  final ApiService apiService;
  AddUserBloc( {required this.apiService}) : super(InitialAddUserState()) {
    on<LoadAddUserEvent>((event, emit) async {
      emit(LoadingAddUserState());
        try{
          await Future.delayed(const Duration(seconds: 1),()async{

            await apiService.addUser(event.userModel);

          });
          emit(SuccessAddUserState());
          print("success");
        }catch(e){
          emit(FailureAddUserState(e.toString()));
      }
    });
  }
}