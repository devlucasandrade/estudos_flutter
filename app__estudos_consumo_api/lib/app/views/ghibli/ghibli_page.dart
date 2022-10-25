import 'package:app_consumo_api/app/models/ghibli_model.dart';
import 'package:app_consumo_api/app/repositories/ghibli_repository.dart';
import 'package:app_consumo_api/app/views/ghibli/ghibli_detail.dart';
import 'package:flutter/material.dart';

class GhibliPage extends StatefulWidget {
  const GhibliPage({Key? key}) : super(key: key);

  @override
  State<GhibliPage> createState() => _GhibliPageState();
}

class _GhibliPageState extends State<GhibliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Studio Ghibli Films'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GhibliModel>>(
        future: GhibliRepository().getFilms(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final dataGhibli = snapshot.data;
            return ListView.builder(
              itemCount: dataGhibli!.length,
              itemBuilder: (context, index) {
                final ghibliModel = dataGhibli[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GhibliDetail(id: ghibliModel),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.network(
                            '${ghibliModel.image}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title: ${ghibliModel.title}\n'
                                'Release: ${ghibliModel.releaseDate}\n'
                                'Time: ${ghibliModel.runningTime} min',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
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
