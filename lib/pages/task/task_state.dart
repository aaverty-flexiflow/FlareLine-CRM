import 'package:flareline_crm/core/models/task_model.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_state.dart';

class TaskState extends BlocBaseState {
  final Map<String, List<TaskModel>> tasks;
  final bool isLoading;
  final String? error;

  TaskState({
    this.tasks = const {},
    this.isLoading = true,
    this.error,
  });

  @override
  List<Object?> get props => [tasks, isLoading, error];

  TaskState copyWith({
    Map<String, List<TaskModel>>? tasks,
    bool? isLoading,
    String? error,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}