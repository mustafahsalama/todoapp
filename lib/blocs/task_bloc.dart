import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/blocs/task_event.dart';
import 'package:todoapp/blocs/task_repository.dart';
import 'package:todoapp/blocs/task_state.dart';
import 'package:todoapp/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository = TaskRepository();

  TaskBloc() : super(TaskInitial()) {
    // Register event handlers for FetchTasks, UpdateTask, and DeleteTask events
    on<FetchTasks>((event, emit) async {
      try {
        List<Task> tasks = await taskRepository.fetchTasks();

        emit(TaskLoaded(tasks: tasks));
      } catch (e) {
        emit(TaskError(message: 'Failed to fetch tasks: $e'));
      }
    });

    on<UpdateTask>((event, emit) async {
      try {

        await taskRepository.updateTask(event.updatedTask);
        emit(TaskUpdated( updatedTask: event.updatedTask,));
        List<Task> tasks = await taskRepository.fetchTasks();
        emit(TaskLoaded( tasks: tasks,));
      } catch (e) {
        emit(TaskError(message: 'Failed to update task: $e'));
      }
    });

    on<DeleteTask>((event, emit) async {
      try {

        await taskRepository.deleteTask(event.taskId);
        emit(TaskDeleted(taskId: event.taskId));
        List<Task> tasks = await taskRepository.fetchTasks();
        emit(TaskLoaded(tasks: tasks));
      } catch (e) {
        emit(TaskError(message: 'Failed to delete task: $e'));
      }
    });
  }
}