import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title, String description) {
    final todo = Todo.add(title: title, description: description);
    state = [...state, todo];
  }

  void toggleTodoCompletion(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);
