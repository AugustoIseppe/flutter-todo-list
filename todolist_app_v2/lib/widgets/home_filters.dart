import 'package:flutter/material.dart';
import 'package:todolist_app_v2/utils/task_filter_enum.dart';
import 'package:todolist_app_v2/utils/total_tasks_model.dart';
import 'package:todolist_app_v2/widgets/todo_card_filter.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCardFilter(
                label: "HOJE",
                taskFilter: TaskFilterEnum.today,
                totalTasksModel:
                    TotalTasksModel(totalTasks: 20, totalTasksFinish: 12),
              ),
              TodoCardFilter(
                label: "AMANHÃ",
                taskFilter: TaskFilterEnum.tomorrow,
                totalTasksModel:
                    TotalTasksModel(totalTasks: 8, totalTasksFinish: 3),
              ),
              TodoCardFilter(
                label: "SEMANA",
                taskFilter: TaskFilterEnum.week,
                totalTasksModel:
                    TotalTasksModel(totalTasks: 10, totalTasksFinish: 9),
              ),
            ],
          ),
        )
      ],
    );
  }
}
