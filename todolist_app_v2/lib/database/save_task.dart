import 'package:todolist_app_v2/database/db_util.dart';

class SaveTask {
  final DbUtil _dbUtil = DbUtil();

  Future<void> saveTask(DateTime date, String description) async {
    final connection = await _dbUtil.openConnection();
    await connection.insert(
      "todo",
      {
        "id": null,
        "descricao": description,
        "data_hora": date.toIso8601String(),
        "finalizado": 0
      },
    );
    await connection.close();
     // Verifique se os dados foram salvos
    final savedTask = await _dbUtil.getData("todo");
     if (savedTask != null) {
      print("Task saved successfully: ${savedTask.runtimeType}");
    } else {
      print("Failed to save the task.");
    }
  }
}
