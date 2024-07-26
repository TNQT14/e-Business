import 'package:ebusiness/app/data/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  AuthCubit() : super(AuthInitial());

  Future<void> createAccountAndLinkItWithGoogleAccount(
      String email,
      String password,
      GoogleSignInAccount googleUser,
      OAuthCredential credential) async {
    emit(AuthLoading());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: googleUser.email,
        password: password,
      );
      await _auth.currentUser!.linkWithCredential(credential);
      await _auth.currentUser!.updateDisplayName(googleUser.displayName);
      await _auth.currentUser!.updatePhotoURL(googleUser.photoUrl);
      emit(UserSingupAndLinkedWithGoogle());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await _auth.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fireStore.collection('User').doc(userCredential.user!.uid).set({
        'userID': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      await userCredential.user!.sendEmailVerification();
      if (userCredential.user!.emailVerified) {

        String uid = _auth.currentUser!.uid;
        UserModel  userModel = await _fireStore.collection('User').doc(uid).get().then((value) {
          return UserModel.fromJson(value.data()!);
        });

        if(userModel.verify_account == 'false'){
          emit(UserNotVerified());
        }

        emit(UserSignIn());
        emit(LoginSuccess(userModel));


      } else {
        await _auth.signOut();
        emit(AuthError('Email not verified. Please check your email.'));
        emit(UserNotVerified());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];
      final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: scopes,).signIn();
      if (googleUser == null) {
        emit(AuthError('Google Sign In Failed'));
        return;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      if (authResult.additionalUserInfo!.isNewUser) {
        // Delete the user account if it is a new user to Create it automatically in Next Screen
        await _auth.currentUser!.delete();

        emit(IsNewUser(googleUser: googleUser, credential: credential));
      } else {
        emit(UserSignIn());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    await _auth.signOut();
    emit(UserSignedOut());
  }

  Future<void> signUpWithEmail(
      String name, String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential =  await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.sendEmailVerification();
      await _fireStore.collection('Users').doc(userCredential.user!.uid).set({
        'userID': userCredential.user!.uid,
        'fullName': name,
        'email': email,
        'phoneNumber': '',
        'address': '',
        'isActive': '',
        'DoB': '',
        'facebookAcountId': '',
        'googleAccountId': '',
        'roleId': '',
      }, SetOptions(merge: true));
      await _auth.signOut();
      emit(UserSingupButNotVerified());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
