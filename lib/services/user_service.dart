// TODO Complete the service class, UserService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following method to handle REST call about the User data
//    to the REST service.
//       a. getUserByLoginAndPassword: to get a user data, given his/her login and password.
//          If no match, this method returns null.
//          This method will be used for constructing the logic of the authentication process in the LoginScreen
//-----------------------------------------------------------------------------------------------------------------------------

import 'dart:developer';

import 'rest.dart';
import '../models/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String login, String password}) async {
    final logins = await Rest.get('users?login=$login&password=$password');
    //not finish
    var show = logins.map((json) => User.fromJson(json)).toList();
    print(show[0].id);
    print('show N= ${show[0].name}');

    if (logins != null) {
      return User(id: show[0].id, name: show[0].name, login: show[0].login); //
    } else {
      return null;
    }
  }
}
