import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up/core/utils/api_service.dart';
import 'package:rise_up/core/utils/constants.dart';
import 'package:rise_up/core/utils/router.dart';
import 'package:rise_up/features/home/presentation/views/widgets/home_view.dart';
import '../../../../core/user_bloc/user_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<UserBloc>(
        create: (BuildContext context) => UserBloc(ApiService()),
    ),

    ],
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              ElevatedButton(
                  onPressed: (){
                    GoRouter.of(context).push(AppRouter.newUserView);
                  },
                  style: const ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll(kPrimaryColor)
                  ),
                  child: const Text("New User", style: TextStyle(color: Colors.white),))
            ],
            title: const Text("USERS", style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
        body: const HomeBody()
    )
    );
  }
}
