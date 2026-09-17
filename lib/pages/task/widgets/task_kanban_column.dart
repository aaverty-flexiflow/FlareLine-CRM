import 'package:flareline_crm/core/models/task_model.dart';
import 'package:flareline_crm/pages/task/widgets/task_card.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';

class TaskKanbanColumn extends StatelessWidget {
  final String title;
  final String status;
  final Color tagColor;
  final List<TaskModel> tasks;
  final VoidCallback? onAddTask;
  final Function(TaskModel, String)? onTaskMoved;
  final Function(TaskModel)? onTaskDeleted;
  final Function(TaskModel)? onTaskEdited;

  const TaskKanbanColumn({
    super.key,
    required this.title,
    required this.status,
    required this.tagColor,
    required this.tasks,
    this.onAddTask,
    this.onTaskMoved,
    this.onTaskDeleted,
    this.onTaskEdited,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 800,
      child: Column(
        children: [
          CommonCard(
            height: 60,
            child: Row(
              children: [
                Expanded(child: Text(title)),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: tagColor, borderRadius: BorderRadius.circular(4)),
                  width: 24,
                  height: 24,
                  child: Text(
                    '${tasks.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: onAddTask,
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DragTarget<TaskModel>(
              onWillAccept: (data) => data != null && data.status != status,
              onAccept: (task) {
                onTaskMoved?.call(task, status);
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: candidateData.isNotEmpty ? tagColor : Colors.transparent,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      final task = tasks[index];
                      return Draggable<TaskModel>(
                        data: task,
                        feedback: Material(
                          elevation: 8,
                          child: SizedBox(
                            width: 280,
                            height: 200,
                            child: TaskCard(
                              task: task,
                              tagColor: tagColor,
                              onDelete: () => onTaskDeleted?.call(task),
                              onEdit: () => onTaskEdited?.call(task),
                            ),
                          ),
                        ),
                        childWhenDragging: Opacity(
                          opacity: 0.5,
                          child: TaskCard(
                            task: task,
                            tagColor: tagColor,
                            onDelete: () => onTaskDeleted?.call(task),
                            onEdit: () => onTaskEdited?.call(task),
                          ),
                        ),
                        child: TaskCard(
                          task: task,
                          tagColor: tagColor,
                          onDelete: () => onTaskDeleted?.call(task),
                          onEdit: () => onTaskEdited?.call(task),
                        ),
                      );
                    },
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 20,
                      color: Colors.transparent,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
