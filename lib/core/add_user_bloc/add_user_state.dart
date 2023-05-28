import 'package:equatable/equatable.dart';
import 'package:rise_up/core/models/user_model.dart';


abstract class AddUserState extends Equatable{}

class InitialAddUserState extends AddUserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingAddUserState extends AddUserState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SuccessAddUserState extends AddUserState {

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FailureAddUserState extends AddUserState {
  final String error;
  FailureAddUserState(this.error);
  @override
  List<Object?> get props => [error];
}