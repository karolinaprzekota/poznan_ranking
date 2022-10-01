import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';

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
                controller: widget.emailcontroller,
              ),
              TextField(
                  decoration: const InputDecoration(hintText: 'Hasło'),
                  controller: widget.passwordcontroller,
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              Text(errorMessage),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: widget.emailcontroller.text,
                        password: widget.passwordcontroller.text);
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
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
