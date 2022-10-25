import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_studies_app/todo/todo_list.dart';
import 'package:provider/provider.dart';

class TodoExample extends StatelessWidget {
  const TodoExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TodoList>(
      create: (_) => TodoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de A FAZER'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AddTodo(),
            const ActionBar(),
            const Description(),
            const TodoListView()
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          list.itemsDescription,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TodoListView extends StatelessWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Observer(
      builder: (_) => Flexible(
        child: ListView.builder(
          itemCount: list.visibreTodos.length,
          itemBuilder: (_, index) {
            final todo = list.visibreTodos[index];
            return Observer(
              builder: (_) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: todo.done,
                onChanged: (flag) => todo.done = flag!,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        todo.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => list.removeTodo(todo),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: 'Adicione um A Fazer',
          contentPadding: EdgeInsets.all(8),
        ),
        controller: _textController,
        textInputAction: TextInputAction.done,
        onSubmitted: (String value) {
          list.addTodo(value);
          _textController.clear();
        },
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Column(
      children: [
        Observer(
          builder: (_) => Column(
            children: [
              RadioListTile(
                dense: true,
                title: const Text('A Fazer'),
                value: VisibilityFilter.all,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!,
              ),
              RadioListTile(
                dense: true,
                title: const Text('Pendentes'),
                value: VisibilityFilter.pending,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!,
              ),
              RadioListTile(
                dense: true,
                title: const Text('Realizados'),
                value: VisibilityFilter.completed,
                groupValue: list.filter,
                onChanged: (filter) => list.filter = filter!,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    list.canRemoveAllCompleted ? list.removeCompleted : null,
                child: const Text(
                  'Remover\n Realizadas',
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed:
                    list.canMarkAllCompleted ? list.markAllAsCompleted : null,
                child: const Text(
                  'Marcar\n como Realizadas',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
