// TODO Complete the file, login/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique.
//      This includes:
//        a. Show or hide the entered password (by tapping on the 'eye' icon)
//        b. Show the error message if the user entered wrong username
//           or password.
//
//   2. Update the states and reflect the changes on the UI:
//        a. when the user types in the 'Username'.
//        b. when the user types in the 'Password'.
//        c. when the user taps on the 'eye' icon (to show/hide the password).
//
//   3. Perform the following operations:
//        a. Proceed to Login - i.e. when the 'Log in' button is tapped on.
//        b. Cancel the login - i.e. when the 'Cancel' button is tapped on.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/screens/edit/edit_screen.dart';
import 'package:exercise3/services/rest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../services/user_service.dart';
import '../../models/user.dart';
import 'login_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTextField(
            hint: 'Username',
            icon: Icons.people,
            onChanged: (value) => _state.username = value),
        _buildTextField(
            hint: 'Password',
            isObsecure: !_state.shows, //change state for show passwrod
            icon: Icons.lock,
            button: IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () => _state.shows = !_state.shows),
            onChanged: (value) => _state.password = value),
        Text(
          '${_state.errorM}',
          //'Invalid username or password!',
          style: TextStyle(color: Colors.red, fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        _buildButtons(context)
      ],
    );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Log in'),
          onPressed: () => _onLoginP(context),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => _onCancelP(context),
        ),
      ],
    );
  }

  void _onLoginP(context) async {
    //perform authentication

    if (_state.username == '' || _state.password == '') {
      _state.errorM = 'Empty Field';
    } else {
      final _user = await UserService.getUserByLoginAndPassword(
          login: _state.username, password: _state.password);

      if (_user != null) {
        var showU = User.copy(_user);
        Navigator.pop(context,
            User(id: showU.id, name: showU.name, photoUrl: showU.photoUrl));
      } else {
        _state.errorM = 'Invalid Username or Password';
      }
    }
  }

  void _onCancelP(context) => Navigator.pushNamed(context, '/');
}
