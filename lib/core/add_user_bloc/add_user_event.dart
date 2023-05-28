import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rise_up/core/models/user_model.dart';

@immutable
abstract class AddUserEvent extends Equatable {
  const AddUserEvent();
}

class LoadAddUserEvent extends AddUserEvent {
  final UserModel userModel;
  const LoadAddUserEvent({required this.userModel});
  @override
  List<Object?> get props => [];
}