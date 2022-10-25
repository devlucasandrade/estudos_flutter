import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_studies_app/form/form_store.dart';

class FormExample extends StatefulWidget {
  const FormExample({Key? key}) : super(key: key);

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final FormStore store = FormStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário de Login',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        width: double.infinity,
        child: Form(
          child: Column(
            children: [
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.name = value,
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    hintText: 'Escolha um nome de usuário',
                    errorText: store.error.username,
                  ),
                ),
              ),
              Observer(
                builder: (_) => AnimatedOpacity(
                  opacity: store.isUserCheckPending ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const LinearProgressIndicator(),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.email = value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Informe o seu email',
                    errorText: store.error.email,
                  ),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.password = value,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Informe uma senha',
                    errorText: store.error.password,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: store.validateAll,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
