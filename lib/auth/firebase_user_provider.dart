import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class StockAdminLineFirebaseUser {
  StockAdminLineFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

StockAdminLineFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<StockAdminLineFirebaseUser> stockAdminLineFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<StockAdminLineFirebaseUser>(
      (user) {
        currentUser = StockAdminLineFirebaseUser(user);
        return currentUser!;
      },
    );
