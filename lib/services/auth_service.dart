import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google sign in
  signInWithGoogle() async {
    // Begin interactive signin with process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtian auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Create new credintials for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Signout user
  signOut() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }
}
