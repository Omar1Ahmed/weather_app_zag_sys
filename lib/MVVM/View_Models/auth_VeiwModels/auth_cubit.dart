import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController RewritePassController = TextEditingController();
  final TextEditingController DisplayNameController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  // Fake login method
  Future<void> login() async {

    emit(AuthFailure(''));
    emit(AuthLoading());

      try {


        print(emailController.text);
        print(passwordController.text);
        dynamic lol = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
print(lol);

        emit(AuthSuccess());


      } on FirebaseAuthException catch(e){
         print('${e.message} Auth Fail');
        emit(AuthFailure(e.message.toString()));


      }
    catch (e) {
        print('$e FAIL');


          emit(AuthFailure('Something went wrong!'));

      }

  }

  // Fake signup method
  Future<void> signup() async {

    emit(AuthFailure(''));
    emit(AuthLoading());

      if(passwordController.text == RewritePassController.text){
        try {

          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text,);
          await FirebaseAuth.instance.currentUser!.updateDisplayName(DisplayNameController.text);

          emit(AuthSuccess());
        } catch (e) {
            if(e is FirebaseAuthException){

            emit(AuthFailure(e.message.toString()));
            }else {

            emit(AuthFailure('Something went wrong!'));
            }

        }
      }else{
        emit(AuthFailure('Passwords are not the same'));

      }
    }
  }
