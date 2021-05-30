// TODO Complete the file, main/float.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Perform the following operations:
//        a. Add a new todo  - i.e. when the user taps on the 'plus' button
//           This operation will navigate to the '/new' route.
//        b. Refresh the screen - i.e. when the user taps on the 'Refresh' button
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'main_screen.dart';

class Float extends StatelessWidget {
  const Float({state}) : _state = state;

  final MainScreenState _state;

  void _onPlusPress(BuildContext context) async {
    //final _todo = await Navigator.pushNamed(context, '/new');
    if (_state.user != null) {
      var _todo = await Navigator.pushNamed(context, '/new');
      print(_state.user.id);
      //_todo = Todo(description: 'This a description', title: 'New Title');
      if (_todo != null) {
        _state.addTodo(_todo);
      }

      //print('todo = $_todo');
    }
  }

  void _onRefreshPress() => _state.refreshTodoListFuture();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          tooltip: 'Add a new todo',
          child: Icon(Icons.add),
          heroTag: null,
          onPressed: () => _onPlusPress(context),
        ),
        FloatingActionButton(
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
            heroTag: null,
            onPressed: () => _onRefreshPress())
      ],
    );
  }
}
