import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app_with_firebase/home_screen.dart';
import 'package:live_score_app_with_firebase/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignIn Screen")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(hintText: "Email"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(hintText: "Password"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter a valid password";
                  }
                  return null;
                },
              ),

              FilledButton(onPressed: _onTapSubmit, child: Text("Submit")),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignUpScreen()),
                  );
                },
                child: Text("Sign-up"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSubmit() {
    if (_formKey.currentState!.validate()) {
      _signInUser();
    }
  }

  void _signInUser() async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailTEController.text.trim(),
            password: _passwordTEController.text,
          );
      showSnackBar("Sign-in Successful");
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.message ?? "Something went wrong");
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
