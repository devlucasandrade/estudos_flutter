import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String nome = '';

  @action
  mudarNome(String valor) => nome = valor;

  @observable
  String email = '';

  @action
  mudarEmail(String valor) => email = valor;

  @observable
  String cpf = '';

  @action
  mudarCPF(String valor) => cpf = valor;
}
