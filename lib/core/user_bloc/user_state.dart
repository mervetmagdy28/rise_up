import 'package:equatable/equatable.dart';

import '../models/user_model.dart';


abstract class UserState extends Equatable{}

class LoadingUsersState extends UserState {
  @override
  List<Object?> get props => [];
}

class SuccessUsersState extends UserState {
  final List<UserModel> users;
  SuccessUsersState(this.users);
  @override
  List<Object?> get props => [users];
}

class FailureUsersState extends UserState {
  final String error;
  FailureUsersState(this.error);
  @override
  List<Object?> get props => [error];
}