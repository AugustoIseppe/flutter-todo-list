import 'package:flutter/material.dart';
import 'package:todolist_app_v2/utils/task_filter_enum.dart';
import 'package:todolist_app_v2/utils/total_tasks_model.dart';

class TodoCardFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum taskFilter;
  final TotalTasksModel totalTasksModel;
  TodoCardFilter({
    super.key,
    required this.label,
    required this.taskFilter,
    required this.totalTasksModel,
  });

  double _getPercentFinish(){
    final total = totalTasksModel.totalTasks ?? 0;
    final totalFinish = totalTasksModel.totalTasksFinish ?? 0.1;
    if(total == 0) {
      return 0.0;
    }
    final percent = (totalFinish * 100) / total;
    return percent / 100;
  }
  var filterSelected = TaskFilterEnum.today;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120, maxWidth: 150),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(.8),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            "${totalTasksModel.totalTasks ?? 0}",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TweenAnimationBuilder(
            tween: Tween(
              begin: 0.0,
              end: _getPercentFinish()
            ),
            duration: Duration(seconds: 2),
            builder: (context, value, child) {
              return  LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.blue[100],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.pink),
              value: value,
            );
  }),
        ],
      ),
    );
  }
}
