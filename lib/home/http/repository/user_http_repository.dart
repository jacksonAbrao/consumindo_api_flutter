import 'dart:convert';

import 'package:consumindo_api/model/user_model.dart';
import 'package:consumindo_api/repository/i_user_repository.dart';
import 'package:http/http.dart' as http;

class UserHttpRepository implements IUserRepository {
  @override
  Future<List<UserModel>> findAllUsers() async {
    Uri baseUrl =
        Uri.parse('https://6296e8d214e756fe3b254d40.mockapi.io/users');
    final response = await http.get(baseUrl);
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap.map((resp) => UserModel.fromMap(resp)).toList();
  }
}
