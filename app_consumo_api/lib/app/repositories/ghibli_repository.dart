import 'package:app_consumo_api/app/models/ghibli_model.dart';
import 'package:dio/dio.dart';

class GhibliRepository {
  final dio = Dio();
  String url = 'https://ghibliapi.herokuapp.com/films/';

  Future<List<GhibliModel>> getFilms() async {
    final response = await dio.get(url);
    final body = response.data as List;
    final filmes = body.map((map) => GhibliModel.fromJson(map)).toList();
    return filmes;
  }
}
