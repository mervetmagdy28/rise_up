part of 'edit_details_bloc.dart';

@immutable
abstract class EditDetailsState {}

class EditDetailsInitial extends EditDetailsState {}
class EditDetailsLoading extends EditDetailsState {}
class EditDetailsSuccess extends EditDetailsState {}
class EditDetailsFailure extends EditDetailsState {

  final String errorMessage;

  EditDetailsFailure(this.errorMessage);
}
