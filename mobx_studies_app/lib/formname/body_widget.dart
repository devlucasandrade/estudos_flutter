import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'form_name_controller.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  _textField({
    onChanged,
    required String labelText,
    required String? Function() errorText,
  }) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            // ignore: unnecessary_null_comparison
            errorText: errorText == null ? null : errorText(),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Nome',
                errorText: controller.validarNome,
                onChanged: controller.client.mudarNome,
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                labelText: 'Email',
                errorText: controller.validarEmail,
                onChanged: controller.client.mudarEmail,
              );
            },
          ),
          Observer(
            builder: (_) {
              return ElevatedButton(
                onPressed: controller.ehValido ? () {} : null,
                child: const Text('Salvar'),
              );
            },
          ),
        ],
      ),
    );
  }
}
