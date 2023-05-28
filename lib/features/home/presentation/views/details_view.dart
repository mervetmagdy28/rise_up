import 'package:flutter/material.dart';
import 'package:rise_up/core/models/user_model.dart';
import 'package:rise_up/features/home/presentation/views/widgets/details_view_body.dart';

import '../../../../core/utils/constants.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("My Profile"),
      ),
      body: DetailsViewBody(userModel: userModel),
    );
  }
}
