import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Tasks',
          style: TextStyle(color: Colors.pink),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list_outlined, color: Colors.black))
        ],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Text('this is home tasks page');
      }),
    );
  }
}
