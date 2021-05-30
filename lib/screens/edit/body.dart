// TODO Complete the file, edit/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether it is for 'editing an existing todo' or 'creating a new todo').
//      This includes:
//        a. The 'done' field will only be enabled if it is an 'editing' mode
//
//   2. Update the states and reflect the changes on the UI:
//        a. when the user types in the 'title'.
//        b. when the user types in the 'description'.
//        c. when the user taps on the 'done' checkbox.
//
//   3. Perform the following operations:
//        a. Accept the updated / created item - i.e. when the 'Ok' button is tapped on.
//        b. Cancel the changes - i.e. when the 'Cancel' button is tapped on.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/models/todo.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final EditScreenState _state;

  @override
  Widget build(BuildContext context) {
    return _buildListView(context);
  }

  ListView _buildListView(BuildContext context) {
    print('check = ${_state.isEdit}');
    if (_state.isEdit == true) {
      return ListView(
        children: [
          _buildTextLisTile(
              label: 'Title',
              value: _state.data.title,
              onChanged: (value) => _state.data.title = value),
          _buildTextLisTile(
              label: 'Description',
              value: _state.data.description,
              onChanged: (value) => _state.data.description = value),
          _checkBoxList(),
          _buildButtons(context)
        ],
      );
    } else {
      return ListView(
        children: [
          _buildTextLisTile(
              label: 'Title',
              value: _state.title,
              onChanged: (value) => _state.title = value),
          _buildTextLisTile(
              label: 'Description',
              value: _state.description,
              onChanged: (value) => _state.description = value),
          _checkBoxList(),
          _buildButtons(context)
        ],
      );
    }
  }

  Center _checkBoxList() {
    if (_state.isEdit == true) {
      return Center(
        child: CheckboxListTile(
          value: _state.data.done,
          onChanged: (value) {
            value == false ? _state.data.done = value : true;
          },
          title: Text('Done'),
        ),
      );
    } else {
      return Center();
    }
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Ok'),
          onPressed: () => _okPress(context),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void _okPress(BuildContext context) async {
    if (_state.isEdit == false) {
      if (_state.title != null && _state.description != null) {
        return Navigator.pop(context,
            Todo(title: _state.title, description: _state.description));
      } else {
        return Navigator.pop(context);
      }
    } else {
      if (_state.title != null && _state.description != null) {
        return Navigator.pop(
            context,
            Todo(
                title: _state.data.title,
                description: _state.data.description,
                done: _state.data.done,
                user: _state.data.user));
      } else {
        return Navigator.pop(context);
      }
    }
  }
}
