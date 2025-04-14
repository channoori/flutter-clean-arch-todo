import 'package:flutter/material.dart';

import 'composition/todo_view.dart';

class TodoPage extends StatelessWidget {
  static String get routeName => '/todo_page';
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Sample'),
      ),
      body: TodoView(),
    );
  }
}
