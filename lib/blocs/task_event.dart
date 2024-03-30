import 'package:equatable/equatable.dart';
import 'package:todoapp/models/task.dart';


abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class FetchTasks extends TaskEvent {
  @override
  List<Object> get props => [];
}

class UpdateTask extends TaskEvent {
  final Task updatedTask;

  UpdateTask(this.updatedTask);

  @override
  List<Object> get props => [updatedTask];
}

class DeleteTask extends TaskEvent {
  final int taskId;

  const DeleteTask(this.taskId);

  @override
  List<Object> get props => [taskId];
}