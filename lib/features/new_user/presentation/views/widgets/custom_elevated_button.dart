// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rise_up/core/add_user_bloc/add_user_bloc.dart';
// import 'package:rise_up/core/add_user_bloc/add_user_event.dart';
// import 'package:rise_up/core/models/user_model.dart';
// import '../../../../../core/add_user_bloc/add_user_state.dart';
// import '../../../../../core/utils/api_service.dart';
// import '../../../../../core/utils/constants.dart';
//
// class CustomElevatedButton extends StatelessWidget {
//   CustomElevatedButton({Key? key, required this.userModel,}) : super(key: key);
//   UserModel userModel=UserModel(status: 'avtive',name: 'mervet',gender: 'female',email: 'klcm@.com');
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddUserBloc(ApiService(),userModel
//     )..add(LoadAddUserEvent()),
//       child:
//             BlocBuilder<AddUserBloc, AddUserState>(
//               builder: (context, state) {
//                 print("objectyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
//                 if (state is LoadingAddUserState) {
//                   return ElevatedButton(
//                     onPressed: (){},
//                     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
//                     child: const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }
//                 if (state is FailureAddUserState) {
//                   return ElevatedButton(
//                       onPressed: (){},
//                       style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
//                       child: const Center(
//                           child:  Text("Error", style: TextStyle(color: Colors.red, fontSize: 20),)
//                       )
//                   );
//                 }
//                 if (state is SuccessAddUserState) {
//                   return const SnackBar(content: Text(" added successfully"));
//                 }
//
//                 return Container();
//               },
//
//     ));
//   }
// }
