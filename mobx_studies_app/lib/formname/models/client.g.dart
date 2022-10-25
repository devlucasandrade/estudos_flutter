// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Client on _ClientBase, Store {
  late final _$nomeAtom = Atom(name: '_ClientBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom = Atom(name: '_ClientBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$cpfAtom = Atom(name: '_ClientBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$_ClientBaseActionController =
      ActionController(name: '_ClientBase', context: context);

  @override
  dynamic mudarNome(String valor) {
    final _$actionInfo = _$_ClientBaseActionController.startAction(
        name: '_ClientBase.mudarNome');
    try {
      return super.mudarNome(valor);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarEmail(String valor) {
    final _$actionInfo = _$_ClientBaseActionController.startAction(
        name: '_ClientBase.mudarEmail');
    try {
      return super.mudarEmail(valor);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarCPF(String valor) {
    final _$actionInfo =
        _$_ClientBaseActionController.startAction(name: '_ClientBase.mudarCPF');
    try {
      return super.mudarCPF(valor);
    } finally {
      _$_ClientBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
email: ${email},
cpf: ${cpf}
    ''';
  }
}
