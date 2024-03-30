import 'package:dio/dio.dart';
import 'package:todoapp/models/task.dart';

class TaskRepository {
  final Dio _dio = Dio();

  Future<List<Task>> fetchTasks() async {
    try {
      Response response = await _dio.get(
          'https://jsonplaceholder.typicode.com/todos');
      return (response.data as List)
          .map((task) => Task.fromJson(task))
          .toList();
    }catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _dio.put('https://jsonplaceholder.typicode.com/todos/${task.id}',
          data: task.toJson());
    }catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }

  Future<void> deleteTask(int taskId) async {
    try {
      await _dio.delete('https://jsonplaceholder.typicode.com/todos/$taskId');
    }catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}