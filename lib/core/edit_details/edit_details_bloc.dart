import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/user_model.dart';
import '../utils/api_service.dart';

part 'edit_details_event.dart';
part 'edit_details_state.dart';

class EditDetailsBloc extends Bloc<EditDetailsEvent, EditDetailsState> {
  final ApiService apiService;
  EditDetailsBloc({required this.apiService}) : super(EditDetailsInitial()) {
    on<EditDataEvent>((event, emit)async {
        emit(EditDetailsLoading());
        try{
          await Future.delayed(const Duration(seconds: 1),()async{
            await apiService.updateUserDetails(event.userModel);

          });
          emit(EditDetailsSuccess());
          print("success");
        }catch(e){
          emit(EditDetailsFailure(e.toString()));
        }

    }
    );
  }
}
