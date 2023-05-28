import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_up/core/models/user_model.dart';
import 'package:rise_up/core/utils/router.dart';
import 'package:rise_up/features/home/presentation/views/widgets/person_profile_image.dart';

import '../../../../../core/utils/constants.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.detailsView,extra: userModel);
      },
      child: Padding(
        padding:
        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                userModel.status=='active'?const PersonProfileImage(activatedColor: Colors.green):const PersonProfileImage(activatedColor: Colors.red),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userModel.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 27),),
                        const SizedBox(height: 10,),
                        Text(userModel.email!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                userModel.gender=='male'?const Icon(Icons.male):const Icon(Icons.female)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
