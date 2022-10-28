import 'package:app_consumo_api/app/controllers/todos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = JsonPlaceHolderTodosController();
  final state =
      ValueNotifier<JsonPlaceHolderTodosState>(JsonPlaceHolderTodosState.start);

  test('deve preencher variavel todos', () async {
    print(controller.state);
    await controller.start();
    print(controller.state);
  });
}
