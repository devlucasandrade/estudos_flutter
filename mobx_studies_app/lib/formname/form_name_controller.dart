import 'package:mobx/mobx.dart';
import 'package:mobx_studies_app/formname/models/client.dart';

part 'form_name_controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get ehValido {
    return validarNome() == null && validarEmail() == null;
  }

  String? validarNome() {
    // ignore: unnecessary_null_comparison
    if (client.nome == null || client.nome.isEmpty) {
      return 'Campo Obrigatório';
    } else if (client.nome.length < 3) {
      return 'O nome precisa ter mais que 3 caracteres.';
    }
    return null;
  }

  String? validarEmail() {
    // ignore: unnecessary_null_comparison
    if (client.email == null || client.email.isEmpty) {
      return 'Campo Obrigatório';
    } else if (!client.email.contains('@')) {
      return 'O email precisa ser válido.';
    }
    return null;
  }
}
