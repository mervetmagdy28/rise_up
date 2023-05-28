import 'package:flutter/material.dart';
import 'package:rise_up/features/new_user/presentation/views/widgets/new_user_body.dart';

import '../../../../core/utils/constants.dart';

class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("New User"),
      ),
      body: NewUserBody(),
    );
  }
}
