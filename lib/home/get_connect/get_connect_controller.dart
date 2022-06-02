// ignore_for_file: avoid_print

import 'package:consumindo_api/repository/i_user_repository.dart';
import 'package:get/get.dart';

class GetConnectController extends GetxController with StateMixin {
  final IUserRepository httpRepository;

  GetConnectController(this.httpRepository);

  @override
  void onInit() {
    super.onInit();
    findUsers();
  }

  Future<void> findUsers() async {
    change([], status: RxStatus.loading());

    try {
      final dados = await httpRepository.findAllUsers();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}
