import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/blocs/task_event.dart';
import 'package:todoapp/blocs/task_state.dart';

import '../blocs/task_bloc.dart';
import '../models/task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                Task task = state.tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(task.title.toString()),
                    trailing: Checkbox(
                      value: task.completed,
                      onChanged: (value) {
                        BlocProvider.of<TaskBloc>(context).add(UpdateTask(Task(
                          id: task.id,
                          title: task.title,
                          completed: value ?? false,
                        )));
                      },
                    ),
                    onLongPress: () {
                      BlocProvider.of<TaskBloc>(context).add(DeleteTask(task.id!));
                    },
                  ),
                );
              },
            );
          } else if (state is TaskError) {
            return Center(child: Text(state.message));
          }
          else if (state is TaskError) {
            return Center(child: Text(state.message));
          }
          else if (state is TaskError) {
            return AlertDialog(content: Center(child: Text(state.message)),title: const Text("Error"),);
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

    );





  }



}