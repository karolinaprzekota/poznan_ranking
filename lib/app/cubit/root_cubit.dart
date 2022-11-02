import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(
          const RootState(
            user: null,
            errorMessage: '',
            isLoading: false,
            isCreatingAccount: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const RootState(
          user: null,
          errorMessage: '',
          isLoading: true,
          isCreatingAccount: false),
    );
    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          RootState(
              user: user,
              errorMessage: '',
              isLoading: false,
              isCreatingAccount: true),
        );
      },
    )..onError(
        (error) {
          emit(
            RootState(
                user: null,
                errorMessage: error.toString(),
                isLoading: false,
                isCreatingAccount: false),
          );
        },
      );
  }

  Future<void> register(
      {required String passwordcontroller,
      required String emailcontroller}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller,
        password: passwordcontroller,
      );
    } catch (error) {
      emit(
        RootState(
            user: null,
            errorMessage: error.toString(),
            isLoading: false,
            isCreatingAccount: false),
      );
    }
  }

  Future<void> signIn(
      {required String emailcontroller,
      required String passwordcontroller}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller,
        password: passwordcontroller,
      );
    } catch (error) {
      emit(
        RootState(
          user: null,
          errorMessage: error.toString(),
          isLoading: false,
          isCreatingAccount: false,
        ),
      );
    }
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
