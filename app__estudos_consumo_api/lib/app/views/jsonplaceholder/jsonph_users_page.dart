import 'package:flutter/material.dart';

import '../../models/jsonph/users_model.dart';
import '../../repositories/jsonph_repository.dart';

class JsonPlaceholderUsers extends StatefulWidget {
  const JsonPlaceholderUsers({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholderUsers> createState() => _JsonPlaceholderUsersState();
}

class _JsonPlaceholderUsersState extends State<JsonPlaceholderUsers> {
  TextStyle textStyle1 = const TextStyle(fontSize: 22);
  TextStyle textStyle2 = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<JsonUsersModel>>(
        future: JsonPlaceholderRepository().getUsers(),
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
                final usersModel = dataJsonph[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Id:${usersModel.id} - Username: ${usersModel.username}',
                            style: textStyle1,
                          ),
                          Text(
                            'Name: ${usersModel.name}',
                            style: textStyle1,
                          ),
                          Text(
                            'Phone: ${usersModel.phone}',
                            style: textStyle1,
                          ),
                          Text(
                            'Address: ${usersModel.street}, ${usersModel.suite}',
                            style: textStyle2,
                          ),
                          Text(
                            'City: ${usersModel.city}, Zipcode: ${usersModel.zipcode}',
                            style: textStyle2,
                          ),
                        ],
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
