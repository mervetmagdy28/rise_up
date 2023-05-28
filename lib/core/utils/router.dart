import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up/core/edit_details/edit_details_bloc.dart';
import 'package:rise_up/core/models/user_model.dart';
import 'package:rise_up/core/utils/api_service.dart';
import 'package:rise_up/features/home/presentation/views/details_view.dart';
import 'package:rise_up/features/home/presentation/views/home.dart';
import 'package:rise_up/features/home/presentation/views/widgets/cutom_alert.dart';
import 'package:rise_up/features/new_user/presentation/views/new_user.dart';

import '../../features/home/presentation/views/widgets/custom_edit_alert.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../add_user_bloc/add_user_bloc.dart';

abstract class AppRouter {
  static String homeView = '/home';
  static String detailsView = '/details';
  static String newUserView = '/newUser';
  static String confirmUser = '/confirmUser';
  static String editUser = '/editUser';
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: confirmUser,
        builder: (BuildContext context, GoRouterState state) {
          return const CustomAlert();
        },
      ),
      GoRoute(
        path: editUser,
        builder: (BuildContext context, GoRouterState state) {
          return const CustomEditAlert();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const Home();
        },
      ),
      GoRoute(
        path: detailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => EditDetailsBloc(apiService: ApiService()),
            child: DetailsView(userModel: state.extra as UserModel,),
          );
        },
      ),
      GoRoute(
        path: newUserView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) => AddUserBloc(apiService: ApiService()),
              child: const NewUser());
        },
      ),
    ],
  );

}