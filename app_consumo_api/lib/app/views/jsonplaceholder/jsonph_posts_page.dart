import 'package:flutter/material.dart';

import '../../models/jsonph/posts_model.dart';
import '../../repositories/jsonph_repository.dart';

class JsonPlaceholderPosts extends StatefulWidget {
  const JsonPlaceholderPosts({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholderPosts> createState() => _JsonPlaceholderPostsState();
}

class _JsonPlaceholderPostsState extends State<JsonPlaceholderPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<JsonPostsModel>>(
        future: JsonPlaceholderRepository().getPosts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final dataJsonph = snapshot.data;
            return ListView.builder(
              itemCount: dataJsonph!.length,
              itemBuilder: (context, index) {
                final postsModel = dataJsonph[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Text(
                        '${postsModel.id}',
                        style: const TextStyle(fontSize: 22),
                      ),
                      title: Text(
                        '${postsModel.title}',
                      ),
                      subtitle: Text(
                        '${postsModel.body}',
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
