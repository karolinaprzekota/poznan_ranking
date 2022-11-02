import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poznan_ranking/app/cubit/root_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.isCreatingAccount == true
                          ? 'Zarejestruj się'
                          : 'Zaloguj się'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: 'E-mail'),
                        controller: emailcontroller,
                      ),
                      TextField(
                          decoration: const InputDecoration(hintText: 'Hasło'),
                          controller: passwordcontroller,
                          obscureText: true),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(state.errorMessage),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (state.isCreatingAccount == false) {
                            //register
                            await context.read<RootCubit>().register(
                                emailcontroller: emailcontroller.text,
                                passwordcontroller: passwordcontroller.text);
                          } else {
                            if (state.isCreatingAccount == true) {
                              //signIn
                              context.read<RootCubit>().signIn(
                                  emailcontroller: emailcontroller.text,
                                  passwordcontroller: passwordcontroller.text);
                            }
                          }
                        },
                        child: Text(state.isCreatingAccount == true
                            ? 'Zarejestruj się'
                            : 'Zaloguj się'),
                      ),
                      const SizedBox(height: 20),
                      if (state.isCreatingAccount == false) ...[
                        TextButton(
                          onPressed: () {},
                          child: Text(state.isCreatingAccount == false
                              ? 'Utwórz konto'
                              : 'Masz już konto?'),
                        ),
                      ]
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
