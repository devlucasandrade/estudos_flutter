import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_studies_app/formname/body_widget.dart';
import 'package:provider/provider.dart';

import 'form_name_controller.dart';

class FormName extends StatefulWidget {
  const FormName({Key? key}) : super(key: key);

  @override
  State<FormName> createState() => _FormNameState();
}

class _FormNameState extends State<FormName> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            controller.ehValido
                ? 'Formulário Válidado'
                : 'Formulário Não Válidado',
          ),
        ),
        centerTitle: true,
      ),
      body: const BodyWidget(),
    );
  }
}
