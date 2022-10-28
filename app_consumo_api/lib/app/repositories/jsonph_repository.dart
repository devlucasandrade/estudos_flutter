import 'package:dio/dio.dart';

import '../models/jsonph/photos_model.dart';
import '../models/jsonph/posts_model.dart';
import '../models/jsonph/todos_model.dart';
import '../models/jsonph/users_model.dart';

class JsonPlaceholderRepository {
  var client = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  Future<List<JsonTodosModel>> getTodos() async {
    final response = await client.get('/todos');
    final body = response.data as List;
    return body.map((map) => JsonTodosModel.fromJson(map)).toList();
  }

  Future<List<JsonPostsModel>> getPosts() async {
    final response = await client.get('/posts');
    final body = response.data as List;
    return body.map((map) => JsonPostsModel.fromJson(map)).toList();
  }

  Future<List<JsonPhotosModel>> getPhotos() async {
    final response = await client.get('/photos');
    final body = response.data as List;
    return body.map((map) => JsonPhotosModel.fromJson(map)).toList();
  }

  Future<List<JsonUsersModel>> getUsers() async {
    final response = await client.get('/users');
    final body = response.data as List;
    return body.map((map) => JsonUsersModel.fromJson(map)).toList();
  }
}
