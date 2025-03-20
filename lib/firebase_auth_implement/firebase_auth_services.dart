import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // 🔹 SIGN UP (Email & Password) and Store in Realtime Database
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = credential.user;
    if (user != null) {
      // Store in "pending_users" first
      DatabaseReference ref = _database.ref("pending_users/${user.uid}");
      await ref.set({
        "email": email,
        "approved": false, // Default: Not approved until admin approves
      });

      print("User registered successfully. Waiting for admin approval.");
    }
    return user;
  } catch (e) {
    print("Some error occurred: $e");
  }
  return null;
}


  // 🔹 SIGN IN (Email & Password) - Check if the User is Approved
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = credential.user!.uid;

    // ✅ Check if the user is approved in the "users" section
    DatabaseReference ref = _database.ref("users/$uid");
    DataSnapshot snapshot = await ref.get();

    if (snapshot.exists && snapshot.child("status").value == "approved") {
      print("User login successful.");
      return credential.user;
    } else {
      print("User is not approved yet. Contact admin.");
      await _auth.signOut(); // ❌ Sign out unapproved users
    }
  } catch (e) {
    print("Some error occurred: $e");
  }
  return null;
}

}