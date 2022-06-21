import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobtimer/app/core/ui/button_with_loader.dart';
import 'package:jobtimer/app/entities/project_status.dart';
import 'package:jobtimer/app/modules/home/controller/home_controller.dart';
import 'package:jobtimer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;
  const ProjectRegisterPage({
    super.key,
    required this.controller,
  });

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.sucess:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Erro ao salvar Projeto').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Criar novo Projeto',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          body: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEC,
                    decoration: const InputDecoration(
                      label: Text('Nome do projeto'),
                    ),
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _estimateEC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Estimativa de horas'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Estimativa obrigatória'),
                      Validatorless.number('Permitido somente numeros'),
                    ]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    child: ButtonWithLoader<ProjectRegisterController,
                        ProjectRegisterStatus>(
                      bloc: widget.controller,
                      selector: (state) =>
                          state == ProjectRegisterStatus.loading,
                      onPressed: () async {
                        final formValid =
                            _formkey.currentState?.validate() ?? false;
                        if (formValid) {
                          final name = _nameEC.text;
                          final estimate = int.parse(_estimateEC.text);
                          await widget.controller.register(name, estimate);
                        }
                      },
                      label: 'Salvar',
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
