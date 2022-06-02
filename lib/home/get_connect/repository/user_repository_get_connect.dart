import 'package:consumindo_api/model/user_model.dart';
import 'package:consumindo_api/repository/i_user_repository.dart';
import 'package:consumindo_api/shared/rest_client.dart';
import 'package:get/get_connect.dart';

class UserRepositoryGetConnect extends GetConnect implements IUserRepository {
  final RestClient restClient;

  UserRepositoryGetConnect(this.restClient);

  @override
  Future<List<UserModel>> findAllUsers() async {
    final response = await restClient.get(
        'https://6296e8d214e756fe3b254d40.mockapi.io/users', decoder: (body) {
      if (body is List) {
        return body.map((resp) => UserModel.fromMap(resp)).toList();
      }
      return null;
    });
    if (response.hasError) {
      throw Exception('Erro ao buscar usuários');
    }
    return response.body!;
  }
}
