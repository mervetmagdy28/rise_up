import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rise_up/core/utils/constants.dart';
import 'package:rise_up/core/utils/router.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('confirm user'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Alert(
              context: context,
              type: AlertType.success,
              title: "Success",
              desc: "user added successfully",
              buttons: [
                DialogButton(
                  onPressed: () {
                       GoRouter.of(context).go(AppRouter.homeView);
                  },
                  width: 120,
                  child: const Text(
                    "ok",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ).show();
          },
        style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
          child: const Text('You are Going to add a new user, press to confirm'),
        ),
      ),
    );
  }
}
