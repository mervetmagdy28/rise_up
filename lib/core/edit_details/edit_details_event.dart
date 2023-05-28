part of 'edit_details_bloc.dart';

@immutable
abstract class EditDetailsEvent {}

class EditDataEvent extends EditDetailsEvent {
  final UserModel userModel;

  EditDataEvent(this.userModel);
}