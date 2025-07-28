import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_provider/pages/todos_provider.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Column(
        children: [
          const AddTodo(),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: [
                for (final todo in ref.watch(todosProvider))
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: todo.isCompleted,
                    title: Text(todo.title),
                    onChanged: (value) {
                      // You can implement toggle logic here if needed
                      ref
                          .read(todosProvider.notifier)
                          .toggleTodoCompletion(todo.id);
                    },
                    secondary: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        ref.read(todosProvider.notifier).removeTodo(todo.id);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: 'Add a new todo',
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final text = textController.text.trim();
              if (text.isNotEmpty) {
                ref.read(todosProvider.notifier).addTodo(text, 'Description');
                textController.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
