class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class UserRepository {
  final List<User> users = [
    User(username: 'user1', password: 'pass1'),
    User(username: 'user2', password: 'pass2'),
  ];

Future<User?> authenticate(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    for (var user in users) {
      if (user.username == username && user.password == password) {
        return user;
      }
    }
    return null;
  }
Future<bool> register(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));

    return true;
  }
}
