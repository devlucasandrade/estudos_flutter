import 'package:app_consumo_api/app/repositories/ghibli_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = GhibliRepository();

  test('deve trazer titulo do primeiro filme', () async {
    final ghibli = await repository.getFilms();
    print(ghibli[0].title);
  });
}
