import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodosNotifier extends ChangeNotifier {
  final List<Todo> todos = [];

  void add(String desc) {
    todos.add(Todo.add(desc: desc));
    notifyListeners();
  }

  void toggle(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
    notifyListeners();
  }

  void removeTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});
