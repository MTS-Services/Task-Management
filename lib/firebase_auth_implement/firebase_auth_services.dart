import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // 🔹 SIGN UP (Email & Password) and Store in Realtime Database
  // In your FirebaseAuthServices class:
Future<User?> signUpWithEmailAndPassword(
    String email, String password, String username) async {
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
        "username": username,
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
      // Sign in with email and password
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
        return credential.user; // Return the user if approved
      } else {
        // Check if the user is in the "pending_users" node
        DatabaseReference pendingRef = _database.ref("pending_users/$uid");
        DataSnapshot pendingSnapshot = await pendingRef.get();

        if (pendingSnapshot.exists) {
          print("User is in pending approval. Please wait for admin.");
        } else {
          print("User does not exist in the system.");
        }

        await _auth.signOut(); // Sign out unapproved users
      }
    } catch (e) {
      print("Some error occurred during sign-in: $e");
    }
    return null;
  }
}
