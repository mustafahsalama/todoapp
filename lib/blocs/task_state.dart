import 'package:equatable/equatable.dart';
import 'package:todoapp/models/task.dart';


abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class TaskUpdated extends TaskState {

  final Task updatedTask;

  const TaskUpdated({required this.updatedTask});

  @override
  List<Object> get props => [updatedTask];
}

class TaskDeleted extends TaskState {
  final int taskId;

  TaskDeleted({required this.taskId});

  @override
  List<Object> get props => [taskId];
}

class TaskError extends TaskState {
  final String message;

  const TaskError({required this.message});

  @override
  List<Object?> get props => [message];
}