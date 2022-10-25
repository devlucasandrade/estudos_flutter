import 'package:app_consumo_api/app/keys/openweather_key.dart';
import 'package:app_consumo_api/app/models/openweather_model.dart';
import 'package:dio/dio.dart';

final _owkey = OpenWeatherKey().key;
String _cidade = 'Salvador';
String _pais = 'br';

class OpenWeatherRepository {
  final dio = Dio();
  String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$_cidade,$_pais&appid=$_owkey&units=metric&lang=pt_br';

  Future<OpenWeatherModel> getClima() async {
    final response = await dio.get(url);
    final body = response.data;
    final clima = OpenWeatherModel.fromJson(body);

    return clima;
  }
}
