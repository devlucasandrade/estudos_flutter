import 'dart:ui';

import 'package:mobx/mobx.dart';

part 'form_store.g.dart';

class CustomColor extends Color {
  CustomColor(int value) : super(value);
}

// ignore: library_private_types_in_public_api
class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  CustomColor color = CustomColor(0);

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => usernameCheck.status == FutureStatus.pending;

  @computed
  bool get canLogin => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  // ignore: avoid_void_async
  Future validateUsername(String value) async {
    if (value.isEmpty) {
      error.username = 'Não pode ficar vazio';
      return;
    }

    try {
      usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await usernameCheck;
      if (!isValid) {
        error.username = 'Usuário não pode ser "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

  @action
  void validatePassword(String value) {
    error.password = value.isEmpty ? 'Não pode ficar vazio' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = value.isEmpty ? 'Não pode ser vazio' : null;
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
  }
}

// ignore: library_private_types_in_public_api
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}
