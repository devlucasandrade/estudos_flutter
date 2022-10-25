import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_studies_app/github_repos/github_store.dart';

class GithubExample extends StatefulWidget {
  const GithubExample({Key? key}) : super(key: key);

  @override
  State<GithubExample> createState() => _GithubExampleState();
}

class _GithubExampleState extends State<GithubExample> {
  final GithubStore store = GithubStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Repositórios'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          UserInput(store),
          ShowError(store),
          LoadingIndicator(store),
          RepositoryListView(store),
        ],
      ),
    );
  }
}

class UserInput extends StatelessWidget {
  const UserInput(this.store, {Key? key}) : super(key: key);
  final GithubStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .6,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                autocorrect: false,
                autofocus: true,
                onSubmitted: (String user) {
                  store.setUser(user);
                  store.fetchRepos();
                },
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 40,
              ),
              onPressed: store.fetchRepos,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ShowError extends StatelessWidget {
  const ShowError(this.store, {Key? key}) : super(key: key);
  final GithubStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.fetchReposFuture.status == FutureStatus.rejected
          ? Row(
              children: [
                const Icon(
                  Icons.warning,
                  color: Colors.deepOrange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Falha ao localizar repositórios para ',
                  style: TextStyle(
                    color: Colors.deepOrange,
                  ),
                ),
                Text(
                  store.user,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator(this.store, {Key? key}) : super(key: key);
  final GithubStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.fetchReposFuture.status == FutureStatus.pending
          ? const LinearProgressIndicator()
          : Container(),
    );
  }
}

class RepositoryListView extends StatelessWidget {
  const RepositoryListView(this.store, {Key? key}) : super(key: key);
  final GithubStore store;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (!store.hasResults) {
            return Container();
          }

          if (store.repositories.isEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não localizado repositório do usuário: ',
                ),
                Text(
                  store.user,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            );
          }
          return ListView.builder(
            itemCount: store.repositories.length,
            itemBuilder: (_, int index) {
              final repo = store.repositories[index];
              return ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        repo.name,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(' (${repo.stargazersCount} ⭐️)')
                  ],
                ),
                subtitle: Text(
                  repo.description,
                  overflow: TextOverflow.fade,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
