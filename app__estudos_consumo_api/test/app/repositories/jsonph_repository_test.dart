import 'package:app_consumo_api/app/repositories/jsonph_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = JsonPlaceholderRepository();

  test('deve trazer uma lista de todos', () async {
    final list = await repository.getTodos();
    print(list[0].title);
  });

  test('deve trazer uma lista de posts', () async {
    final list = await repository.getPosts();
    print(list[0].title);
  });

  test('deve trazer uma lista de photos', () async {
    final list = await repository.getPhotos();
    print(list[0].title);
  });

  test('deve trazer uma lista de users', () async {
    final list = await repository.getUsers();
    print(list[0].name);
  });
}
