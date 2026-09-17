

import 'package:flareline_crm/core/models/task_model.dart';
import 'package:flareline_crm/core/services/app_config.dart';
import 'package:flareline_crm/pages/task/task_state.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_viewmodel.dart';
import 'package:flutter/material.dart';

class TaskViewModel extends BlocBaseViewModel<TaskState> {
  TaskViewModel(BuildContext context) : super(context, TaskState());

  @override
  void init(BuildContext context) {
    super.init(context);
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final tasks = await AppConfig.dataService.getTasks();
      final groupedTasks = _groupTasksByStatus(tasks);
      emit(state.copyWith(
        tasks: groupedTasks,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Map<String, List<TaskModel>> _groupTasksByStatus(List<TaskModel> tasks) {
    final Map<String, List<TaskModel>> grouped = {
      'todo': [],
      'inprogress': [],
      'needreview': [],
      'done': [],
    };

    for (final task in tasks) {
      if (grouped.containsKey(task.status)) {
        grouped[task.status]!.add(task);
      }
    }

    return grouped;
  }

  Future<void> addTask(TaskModel task) async {
    try {
      emit(state.copyWith(isLoading: true));
      await AppConfig.dataService.addTask(task);
      await _loadTasks(); // Reload all tasks
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      emit(state.copyWith(isLoading: true));
      await AppConfig.dataService.updateTask(task);
      await _loadTasks(); // Reload all tasks
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      emit(state.copyWith(isLoading: true));
      await AppConfig.dataService.deleteTask(id);
      await _loadTasks(); // Reload all tasks
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> moveTask(String id, String newStatus) async {
    try {
      emit(state.copyWith(isLoading: true));
      await AppConfig.dataService.moveTask(id, newStatus);
      await _loadTasks(); // Reload all tasks
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
