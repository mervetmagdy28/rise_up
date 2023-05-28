import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rise_up/core/utils/api_service.dart';
import 'package:rise_up/features/home/presentation/views/widgets/user_item.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/user_bloc/user_bloc.dart';
import '../../../../../core/user_bloc/user_event.dart';
import '../../../../../core/user_bloc/user_state.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        ApiService(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingUsersState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FailureUsersState) {
            return const Center(child:  Text("Error"));
          }
          if (state is SuccessUsersState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return UserItem(userModel: userList[index]);
                });
          }

          return Container();
        },
      ),
    );
  }
}