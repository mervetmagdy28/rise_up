import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rise_up/core/add_user_bloc/add_user_state.dart';
import 'package:rise_up/core/models/user_model.dart';
import 'package:rise_up/core/utils/constants.dart';
import '../../../../../core/add_user_bloc/add_user_bloc.dart';
import '../../../../../core/add_user_bloc/add_user_event.dart';
import '../../../../../core/utils/router.dart';
import 'custom_text_form_field.dart';

class NewUserBody extends StatefulWidget {
  NewUserBody({Key? key}) : super(key: key);

  @override
  State<NewUserBody> createState() => _NewUserBodyState();
}

class _NewUserBodyState extends State<NewUserBody> {
  final _key = GlobalKey<FormState>();

  TextEditingController name=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController active=TextEditingController();
  Widget sizedBox=const SizedBox(height: 20,);
  String gender = "female";
  String activation = "active";
  UserModel userModel=UserModel(email: 'email@example.com',gender: 'female',name: 'mervet',status: 'active');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddUserBloc,AddUserState>(
        builder: (context,state){
        if(state is SuccessAddUserState){
          Alert(
            context: context,
            type: AlertType.success,
            title: "Success",
            desc: "user added successfully",
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                width: 120,
                child: const Text(
                  "ok",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ).show();
          return  NewUserBody();
        }if (state is LoadingAddUserState){
          return const Center(child: CircularProgressIndicator());
        }if (state is FailureAddUserState){
          return const SnackBar(content: Text("There is an error try again later"));
        }
        return InitalBody();
        }, );
  }
  void postUser(context){
    BlocProvider.of<AddUserBloc>(context).add(LoadAddUserEvent(context,userModel: userModel,));
  }
  Widget InitalBody(){
    return ListView(
      children: [
        Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                sizedBox,
                CustomTextFormField(
                    controller: name,
                    labelText: 'Name',
                    validator: (data) {
                      if (data!.isEmpty && data.trim()=='') {
                        return "field is required";
                      }else if(data.trim()==''){
                        return 'invalid email';
                      }
                      userModel.name=data;
                      return null;
                    },
                    hintText: 'name'
                ),
                sizedBox,
                CustomTextFormField(
                    controller: email,
                    labelText: 'Email',
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "field is required";
                      }else if(!data.contains('@')){
                        return 'invalid email';
                      }
                      userModel.email=data;
                      return null;
                    },
                    hintText: 'email Ex:user@exmaple.com'
                ),
                sizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    RadioListTile(
                      activeColor: kPrimaryColor,
                      title: const Text("Male"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                          userModel.gender=gender;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Female"),
                      value: "female",
                      activeColor: kPrimaryColor,
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                          userModel.gender=gender;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Activation", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    RadioListTile(
                      title: const Text("Active"),
                      value: "active",
                      activeColor: kPrimaryColor,
                      groupValue: activation,
                      onChanged: (value){
                        setState(() {
                          activation = value.toString();
                          userModel.status=activation;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Inactive"),
                      value: "Inactive",
                      activeColor: kPrimaryColor,
                      groupValue: activation,
                      onChanged: (value){
                        setState(() {
                          activation = value.toString();
                          userModel.status=activation;
                        });
                      },
                    ),
                  ],
                ),
                sizedBox,
                // CustomElevatedButton(userModel: userModel)
                ElevatedButton(onPressed: (){
                 // postUser(context);
                  if (_key.currentState!.validate()) {
                    postUser(context);
                      GoRouter.of(context).go(AppRouter.homeView);
                  }
                },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
                    child: const Text("Add User"))
              ],
            ),
          ),
        )
      ],
    );
  }
}
