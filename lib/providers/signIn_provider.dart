import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class SignInProvider extends ChangeNotifier {
  // instance of firebaseauth, facebook and google
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  //hasError, errorCode, provider,uid, email, name, imageUrl
  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  SignInProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("signed_in", true);
    _isSignedIn = true;
    notifyListeners();
  }

  // sign in with google
  Future signInWithGoogle() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // executing our authentication
      try {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // signing to firebase user instance
        final User userDetails =
            (await firebaseAuth.signInWithCredential(credential)).user!;

        // now save all values
        _name = userDetails.displayName;
        _email = userDetails.email;
        _imageUrl = userDetails.photoURL;
        _provider = "GOOGLE";
        _uid = userDetails.uid;
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "account-exists-with-different-credential":
            _errorCode =
                "You already have an account with us. Use correct provider";
            _hasError = true;
            notifyListeners();
            break;

          case "null":
            _errorCode = "Some unexpected error while trying to sign in";
            _hasError = true;
            notifyListeners();
            break;
          default:
            _errorCode = e.toString();
            _hasError = true;
            notifyListeners();
        }
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  Future<User> signInWithApple({List<Scope> scopes = const []}) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final result = await TheAppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.fullName, Scope.email])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:
        final AppleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
        final UserCredential =
            await firebaseAuth.signInWithCredential(credential);
        final firebaseUser = UserCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = AppleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
            code: 'ERROR_AUTHORIZATION_DENIED',
            message: result.error.toString());

      case AuthorizationStatus.cancelled:
        throw PlatformException(
            code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');

      default:
        throw UnimplementedError();
    }
  }

//  Future<AuthCredential?> getAppleCredentials() async {
//    try {
//      final result = await SignInWithApple.getAppleIDCredential(
//        scopes: [
//          AppleIDAuthorizationScopes.email,
//          AppleIDAuthorizationScopes.fullName,
//        ],
//      );
//
//      final AuthCredential credential = OAuthProvider("apple.com").credential(
//        idToken: result.identityToken,
//        accessToken: result.authorizationCode,
//      );
//
//      return credential;
//    } catch (error) {
//      print("Error obtaining Apple credentials: $error");
//      return null;
//    }
//  }
//
//  // Iniciar sesión con Apple y autenticar en Firebase
//  Future<void> signInWithApple() async {
//    try {
//      final AuthCredential? appleCredentials = await getAppleCredentials();
//
//      if (appleCredentials != null) {
//        final UserCredential userCredential =
//            await firebaseAuth.signInWithCredential(appleCredentials);
//
//        final User userDetails = userCredential.user!;
//
//        _name = userDetails.displayName ?? "";
//        _email = userDetails.email ?? "";
//        _imageUrl = userDetails.photoURL ?? "";
//        _provider = 'APPLE';
//        _uid = userDetails.uid;
//
//        notifyListeners();
//      } else {
//        // Manejar el caso en que las credenciales de Apple son nulas
//        _errorCode = "Unable to obtain Apple credentials";
//        _hasError = true;
//        notifyListeners();
//      }
//    } on FirebaseAuthException catch (e) {
//      print("Firebase Auth Exception: ${e.code}");
//
//      switch (e.code) {
//        case "account-exists-with-different-credential":
//          _errorCode =
//              "You already have an account with us. Use correct provider";
//          _hasError = true;
//          break;
//
//        case "null":
//          _errorCode = "Some unexpected error while trying to sign in";
//          _hasError = true;
//          break;
//
//        default:
//          _errorCode = e.toString();
//          _hasError = true;
//      }
//
//      notifyListeners();
//    }
//  }
//
  // ENTRY FOR CLOUDFIRESTORE
  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _name = snapshot['name'],
              _email = snapshot['email'],
              _imageUrl = snapshot['image_url'],
              _provider = snapshot['provider'],
            });
  }

  Future saveDataToFirestore() async {
    try {
      final DocumentReference r =
          FirebaseFirestore.instance.collection("users").doc(uid);
      if (_name != null &&
          _email != null &&
          _uid != null &&
          _imageUrl != null &&
          _provider != null)
        await r.set({
          "name": _name,
          "email": _email,
          "uid": _uid,
          "image_url": _imageUrl,
          "provider": _provider,
        });
      notifyListeners();
    } catch (e) {
      print("Error al guardar datos en Firestore: $e");
    }
  }

  Future saveDataToSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    if (_uid == null) {
      return;
    }
    await s.setString('name', _name!);
    await s.setString('email', _email!);
    await s.setString('uid', _uid!);
    await s.setString('image_url', _imageUrl!);
    await s.setString('provider', _provider!);
    notifyListeners();
  }

  Future getDataFromSharedPreferences() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _name = s.getString('name');
    _email = s.getString('email');
    _imageUrl = s.getString('image_url');
    _uid = s.getString('uid');
    _provider = s.getString('provider');
    notifyListeners();
  }

  // checkUser exists or not in cloudfirestore
  Future<bool> checkUserExists() async {
    await Future.delayed(Duration(seconds: 1));

    try {
      DocumentSnapshot snap =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      if (snap.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error al verificar la existencia del usuario: $e");
      return false;
    }
  }

  // signout
  Future userSignOut() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut;
    await googleSignIn.signOut();

    _isSignedIn = false;
    notifyListeners();
    // clear all storage information
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
  }

  void phoneNumberUser(User user, email, name) {
    _name = name;
    _email = email;
    _imageUrl =
        "https://winaero.com/blog/wp-content/uploads/2017/12/User-icon-256-blue.png";
    _uid = user.phoneNumber;
    _provider = "PHONE";
    notifyListeners();
  }
}
