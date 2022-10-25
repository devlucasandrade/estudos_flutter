import 'package:flutter/material.dart';

import '../../models/jsonph/photos_model.dart';
import '../../repositories/jsonph_repository.dart';

class JsonPlaceholderPhotos extends StatefulWidget {
  const JsonPlaceholderPhotos({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholderPhotos> createState() => _JsonPlaceholderPhotosState();
}

class _JsonPlaceholderPhotosState extends State<JsonPlaceholderPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<JsonPhotosModel>>(
        future: JsonPlaceholderRepository().getPhotos(),
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
                // JsonModel().completed;
                final photosModel = dataJsonph[index];
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: Text(
                      '${photosModel.id}',
                      style: const TextStyle(fontSize: 22),
                    ),
                    title: Image.network(
                      '${photosModel.thumbnailUrl}',
                    ),
                    subtitle: Text(
                      '${photosModel.title}',
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
