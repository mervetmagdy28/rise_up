import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiService {
  String userUrl = 'https://gorest.co.in/public/v2/users';
  String token='438c34d8072b32cfce36f91928c6225f2c70ceff5d067d0f874793710c3ab768';


  Future<List<UserModel>> getUsers() async {
   try{
     var response = await http.get(Uri.parse(userUrl),
         headers: {
           "Authorization": "Bearer $token"
     }
     );
     final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } catch(e) {
      print(e);
      throw Exception(e);
    }
  }

  addUser(UserModel userModel)async{
    try{
      var response= await http.post(Uri.parse(userUrl),body: json.encode({
        'id':1,
        "name": userModel.name,
        "email": userModel.email,
        "gender": userModel.gender,
        "status": userModel.status
      }),headers:{
        "Authorization": "Bearer $token"
      });
    }catch(e){
      print(e);
      throw Exception(e);

    }

  }

  updateUserDetails(UserModel userModel)async {

    try{
      var response= await http.Client().put(
        Uri.parse('$userUrl/${userModel.id.toString()}'),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          'id':userModel.id,
          "name": userModel.name,
          "email": userModel.email,
          "gender": userModel.gender,
          "status": userModel.status
        }),

      );

    }catch(e){
      throw Exception(e);
    }
  }

  deleteUser(UserModel userModel)async{
    try{
      var response= await http.delete(Uri.parse("$userUrl/${userModel.id}"),headers:{
        "Authorization": "Bearer $token"
      });
    }catch(e){
      print(e);
      throw Exception(e);

    }

  }
}

