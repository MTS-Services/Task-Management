import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> singUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Some error Occurred");
    }
    return null;
  }

  Future<void> signUpWithPhoneNumber(
      String phoneNumber,
      Function(String) onCodeSent,
      Function(String) onVerificationFailed) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);

          print("User signed up successfully");
        },
        verificationFailed: (FirebaseAuthException e) {
          onVerificationFailed(e.message ?? "Unknown error");
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("OTP code auto retrieval timed out");
        },
      );
    } catch (e) {
      print("Error during phone number verification: $e");
    }

    Future<User?> verifyOtpAndSignUp(
        String verificationId, String smsCode) async {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      } catch (e) {
        print("Error verifying OTP: $e");
      }
      return null;
    }
  }

  Future<User?> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Some error Occurred");
    }
    return null;
  }

  Future<void> setEmailVerificationLink() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }
}
