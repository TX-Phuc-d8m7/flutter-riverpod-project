import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model for a Todo item
class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  Todo copyWith({String? id, String? title, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}

// StateNotifier to manage the list of todos
class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(String title) {
    final todo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    state = [...state, todo];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// Provider for the TodosNotifier
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>(
  (ref) => TodosNotifier(),
);
