import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app_v2/database/save_task.dart';
import 'package:todolist_app_v2/widgets/calendar_button.dart';
import 'package:todolist_app_v2/widgets/form_login.dart';
import 'package:validatorless/validatorless.dart';

class CreateTask extends StatefulWidget {

  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
    void _onDateSelected(DateTime? date) {
    setState(() {
      _selectedDate = date;
    });
  }
  final dateFormat = DateFormat('dd/MM/y');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.deepPurpleAccent,
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Criar Atividade",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Formulario(
                labelText: 'Nova Task',
                validator: Validatorless.required('Insira um tarefa'),
                controller: _taskController,
              ),
              const SizedBox(
                height: 10,
              ),
              CalendarButton(
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            final formIsValid = _formKey.currentState!.validate();
            if(formIsValid) {
              SaveTask saveTask = SaveTask();
              saveTask.saveTask(_selectedDate!, _taskController.text);
              
            }
            print("Data selecionada pelo usuário: ${dateFormat.format(_selectedDate!)}");
          },
          label: const Text(
            "Salvar Task",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
