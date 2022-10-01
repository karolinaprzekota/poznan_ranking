import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Zaloguj się'),
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
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text("Zaloguj się"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
