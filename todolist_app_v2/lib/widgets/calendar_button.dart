import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarButton extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalendarButton({super.key, required this.onDateSelected});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  DateTime? dataSelecionada;
  final dateFormat = DateFormat('dd/MM/y');
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(const Duration(days: 10 * 365));
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: lastDate,
        );
        setState(() {
          dataSelecionada = selectedDate;
          dateFormat.format(dataSelecionada!);
        });
        widget.onDateSelected(selectedDate!);
      },
      child: Container(
        // width: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.today,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(dataSelecionada == null ?
              "Selecione uma data" : DateFormat('dd/MM/yyyy').format(dataSelecionada!),
              style: const TextStyle(color: Colors.grey),
            ),
            TextButton(onPressed: () {
              print(dateFormat.format(dataSelecionada!));
            }, child: Text("asdasd"))
          ],
        ),
      ),
    );
  }
}
