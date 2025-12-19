import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/widgets/widgets.dart';
import '../ui/input_decoration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: const _LoginForm(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Create new account',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
          key: loginForm.formKey,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authinputDecoration(
                    hintText: 'name@example.com',
                    prefixIcon: Icons.alternate_email,
                    labelText: 'Email'),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'The entered value is not valid';
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecorations.authinputDecoration(
                    hintText: '********',
                    prefixIcon: Icons.lock_outline,
                    labelText: 'Password'),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'The password must be at least 6 characters';
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                  elevation: 0,
                  disabledColor: Colors.grey,
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          if (loginForm.isValidForm()) return;

                          loginForm.isLoading = true;

                          await Future.delayed(const Duration(seconds: 2));

                          //Todo: validar si el login es correcto

                          loginForm.isLoading = false;

                          Navigator.pushReplacementNamed(context, 'home');
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Loading...' : 'Login',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ))
            ],
          )),
    );
  }
}
