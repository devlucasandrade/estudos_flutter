import 'package:app_consumo_api/app/models/jsonph/todos_model.dart';
import 'package:app_consumo_api/app/repositories/jsonph_repository.dart';
import 'package:flutter/cupertino.dart';

class JsonPlaceHolderTodosController {
  List<JsonTodosModel> todos = [];
  final repository = JsonPlaceholderRepository();
  final state =
      ValueNotifier<JsonPlaceHolderTodosState>(JsonPlaceHolderTodosState.start);

  Future start() async {
    state.value = JsonPlaceHolderTodosState.loading;
    try {
      todos = await repository.getTodos();
      state.value = JsonPlaceHolderTodosState.success;
    } catch (e) {
      state.value = JsonPlaceHolderTodosState.error;
    }
    state.value = JsonPlaceHolderTodosState.success;
  }
}

enum JsonPlaceHolderTodosState { start, loading, success, error }
