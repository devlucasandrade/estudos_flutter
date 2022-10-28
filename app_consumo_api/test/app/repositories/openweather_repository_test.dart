import 'package:app_consumo_api/app/repositories/openweather_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = OpenWeatherRepository();

  test('deve trazer a cidade, pais e temperatura', () async {
    final weather = await repository.getClima();
    print('${weather.city} ${weather.country} ${weather.temp}');
  });
}
