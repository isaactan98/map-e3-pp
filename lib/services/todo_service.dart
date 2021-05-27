// TODO Complete the service class, TodoService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following methods to handle REST calls about the Todo data
//    to the REST service.
//       a. getTodoListByUser: to get all the todos for a user (with given user id).
//       b. addTodo: to add a new todo.
//       c. updateTodo: to edit a todo.
//       d. removeTodo: to delete a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getTodoListByUser(int userId) async {
    final listJson = await Rest.get('todos?user=$userId');
    //convert response to object
    listJson.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {}

  static Future<Todo> updateTodo(Todo todo) async {}

  static Future<void> removeTodo(Todo todo) async {}
}
