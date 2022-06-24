import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobtimer/app/core/ui/button_with_loader.dart';
import 'package:jobtimer/app/modules/project/task/controller/task_controller.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;

  const TaskPage({super.key, required this.controller});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameEC.dispose();
    _durationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskController, TaskStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state == TaskStatus.success) {
          Navigator.pop(context);
        } else if (state == TaskStatus.failure) {
          AsukaSnackbar.alert('Erro ao salvar task').show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Criar nova task',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  decoration: InputDecoration(
                    label: Text('nome da Task'),
                  ),
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _durationEC,
                  decoration: InputDecoration(
                    label: Text('Duração da Task'),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Duração Obrigatório'),
                    Validatorless.number('Somente Numeros')
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  child: ButtonWithLoader<TaskController, TaskStatus>(
                    bloc: widget.controller,
                    selector: (state) => state == TaskStatus.loading,
                    label: 'Salvar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        final duration = int.parse(_durationEC.text);
                        widget.controller.register(_nameEC.text, duration);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
