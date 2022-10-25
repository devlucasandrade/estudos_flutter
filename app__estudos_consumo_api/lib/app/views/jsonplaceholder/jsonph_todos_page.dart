import 'package:app_consumo_api/app/controllers/todos_controller.dart';
import 'package:flutter/material.dart';

class JsonPlaceholderTodos extends StatefulWidget {
  const JsonPlaceholderTodos({Key? key}) : super(key: key);

  @override
  State<JsonPlaceholderTodos> createState() => _JsonPlaceholderTodosState();
}

class _JsonPlaceholderTodosState extends State<JsonPlaceholderTodos> {
  final controller = JsonPlaceHolderTodosController();

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        final todosModel = controller.todos[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: Checkbox(
                value: todosModel.completed,
                onChanged: (value) {},
              ),
              title: Text(
                '${todosModel.title}',
              ),
            ),
          ),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 10),
        child: const Text('Tentar novamente'),
        onPressed: () {
          controller.start();
        },
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  _stateManagement(JsonPlaceHolderTodosState state) {
    switch (state) {
      case JsonPlaceHolderTodosState.start:
        return _start();
      case JsonPlaceHolderTodosState.loading:
        return _loading();
      case JsonPlaceHolderTodosState.error:
        return _error();
      case JsonPlaceHolderTodosState.success:
        return _success();

      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.start();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return _stateManagement(controller.state.value);
        },
      ),
    );
  }
}
