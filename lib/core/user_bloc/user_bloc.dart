import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up/core/user_bloc/user_event.dart';
import 'package:rise_up/core/user_bloc/user_state.dart';
import 'package:rise_up/core/utils/api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;

  UserBloc(this.apiService) : super(LoadingUsersState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(LoadingUsersState());
      try {
        final users = await apiService.getUsers();
        emit(SuccessUsersState(users));
      } catch (e) {
        emit(FailureUsersState(e.toString()));
        print(e);
      }
    });
  }
}