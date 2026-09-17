import 'package:flareline_crm/core/models/task_model.dart';
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/task/add_task_widget.dart';
import 'package:flareline_crm/pages/task/task_state.dart';
import 'package:flareline_crm/pages/task/task_viewmodel.dart';
import 'package:flareline_crm/pages/task/widgets/task_kanban_column.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_stless_widget.dart';
import 'package:flutter/material.dart';

class TasksPage extends CrmLayout {
  const TasksPage({super.key});

  @override
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    return 'Tâches';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: AddTaskWidget(),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return TaskPageView();
  }
}

class TaskPageView extends BlocBaseStlessWidget<TaskViewModel, TaskState> {
  TaskPageView({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, TaskViewModel viewModel, TaskState state) {
    
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Erreur: ${state.error}',
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => viewModel.init(context),
              child: const Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    return Wrap(
      runSpacing: 20,
      spacing: 32,
      children: [
        TaskKanbanColumn(
          title: 'À faire',
          status: 'todo',
          tagColor: CrmColors.sky,
          tasks: state.tasks['todo'] ?? [],
          onAddTask: () => _showAddTaskDialog(context, viewModel, 'todo'),
          onTaskMoved: (task, newStatus) => viewModel.moveTask(task.id, newStatus),
          onTaskDeleted: (task) => _showDeleteConfirmation(context, viewModel, task),
          onTaskEdited: (task) => _showEditTaskDialog(context, viewModel, task),
        ),
        TaskKanbanColumn(
          title: 'En cours',
          status: 'inprogress',
          tagColor: CrmColors.orange,
          tasks: state.tasks['inprogress'] ?? [],
          onAddTask: () => _showAddTaskDialog(context, viewModel, 'inprogress'),
          onTaskMoved: (task, newStatus) => viewModel.moveTask(task.id, newStatus),
          onTaskDeleted: (task) => _showDeleteConfirmation(context, viewModel, task),
          onTaskEdited: (task) => _showEditTaskDialog(context, viewModel, task),
        ),
        TaskKanbanColumn(
          title: 'À réviser',
          status: 'needreview',
          tagColor: CrmColors.red,
          tasks: state.tasks['needreview'] ?? [],
          onAddTask: () => _showAddTaskDialog(context, viewModel, 'needreview'),
          onTaskMoved: (task, newStatus) => viewModel.moveTask(task.id, newStatus),
          onTaskDeleted: (task) => _showDeleteConfirmation(context, viewModel, task),
          onTaskEdited: (task) => _showEditTaskDialog(context, viewModel, task),
        ),
        TaskKanbanColumn(
          title: 'Terminé',
          status: 'done',
          tagColor: CrmColors.primary,
          tasks: state.tasks['done'] ?? [],
          onAddTask: () => _showAddTaskDialog(context, viewModel, 'done'),
          onTaskMoved: (task, newStatus) => viewModel.moveTask(task.id, newStatus),
          onTaskDeleted: (task) => _showDeleteConfirmation(context, viewModel, task),
          onTaskEdited: (task) => _showEditTaskDialog(context, viewModel, task),
        ),
      ],
    );
  }

  @override
  TaskViewModel viewModelBuilder(BuildContext context) {
    return TaskViewModel(context);
  }

  void _showAddTaskDialog(BuildContext context, TaskViewModel viewModel, String status) {
    // TODO: Implémenter le dialogue d'ajout de tâche
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ajouter une tâche dans $status')),
    );
  }

  void _showEditTaskDialog(BuildContext context, TaskViewModel viewModel, TaskModel task) {
    // TODO: Implémenter le dialogue d'édition de tâche
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Modifier la tâche: ${task.task}')),
    );
  }

  void _showDeleteConfirmation(BuildContext context, TaskViewModel viewModel, TaskModel task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmer la suppression'),
        content: Text('Êtes-vous sûr de vouloir supprimer la tâche "${task.task}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              viewModel.deleteTask(task.id);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}

