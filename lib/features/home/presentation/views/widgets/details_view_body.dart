import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rise_up/core/edit_details/edit_details_bloc.dart';
import 'package:rise_up/core/models/user_model.dart';
import 'package:rise_up/core/utils/api_service.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/router.dart';
import '../../../../new_user/presentation/views/widgets/custom_text_form_field.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  final _key = GlobalKey<FormState>();

  TextEditingController name=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController active=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDetailsBloc, EditDetailsState>(
        builder: (context,state){
          if(state is EditDetailsSuccess){
          }if (state is EditDetailsLoading){
            return const Center(child: CircularProgressIndicator());
          }if (state is EditDetailsFailure){
            return const SnackBar(content: Text("There is an error try again later"));
          }
          return InitailBody();
        });
  }

  Widget InitailBody(){

    String? gender = widget.userModel.gender;
    String? activation = widget.userModel.status;
    String? hintEmail=widget.userModel.email;
    String? hintName=widget.userModel.name;
    return ListView(
      children: [
        Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Alert",
                        desc: "do you wanna delete this user",
                        buttons: [
                          DialogButton(
                            onPressed: () async{
                              await ApiService().deleteUser(widget.userModel);
                              GoRouter.of(context).pop();
                              GoRouter.of(context).go(AppRouter.homeView);
                            },
                            width: 120,
                            child: const Text(
                              "ok",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          DialogButton(
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            width: 120,
                            child: const Text(
                              "No",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ).show();
                    }, icon: const Icon(Icons.delete, color: Colors.red,size: 30,)),
                  ],
                ),
                sizedBox,
                CustomEditTextFormField(
                    controller: name,
                    labelText: 'Name',
                    validator: (data) {
                      data ==null? (widget.userModel.name = hintName): (widget.userModel.name=data);
                      return null;
                    },
                    hintText: hintName!
                ),
                sizedBox,
                CustomEditTextFormField(
                  controller: email,
                  labelText: 'Email',
                  validator: (data) {
                    data ==null? (widget.userModel.email = hintEmail): (widget.userModel.email=data);
                    return null;
                  },
                  hintText: hintEmail!,
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
                          widget.userModel.gender=gender;
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
                          widget.userModel.gender=gender;
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
                          widget.userModel.status=activation;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Inactive"),
                      value: "inactive",
                      activeColor: kPrimaryColor,
                      groupValue: activation,
                      onChanged: (value){
                        setState(() {
                          activation = value.toString();
                          widget.userModel.status=activation;
                        });
                      },
                    ),
                  ],
                ),
                sizedBox,
                // CustomElevatedButton(userModel: userModel)
                ElevatedButton(onPressed: (){
                  if (_key.currentState!.validate()) {
                    editUser(context);
                    GoRouter.of(context).go(AppRouter.editUser);
                  }
                },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
                    child: const Text("Edit my Details"))
              ],
            ),
          ),
        )
      ],
    );
  }
  void editUser(context){
    BlocProvider.of<EditDetailsBloc>(context).add(EditDataEvent(widget.userModel));
    print(widget.userModel.name);
    print(widget.userModel.email);
    print(widget.userModel.status);
    print(widget.userModel.gender);
  }
}
