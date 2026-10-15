import 'package:flutter/material.dart';
import 'package:forumapp/views/register_page.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:get/get.dart';

import '../controllers/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Authentication _authentication = Get.put(Authentication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            InputWidget(
              hintText: 'Username',
              controller: _usernameController,
              obscured: false,
            ),
            SizedBox(height: 20),
            InputWidget(
              hintText: 'Password',
              controller: _passwordController,
              obscured: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await _authentication.login(
                  username: _usernameController.text.trim(),
                  password: _passwordController.text.trim(),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              child: Obx(() {
                return _authentication.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login');
              }),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.off(() => RegisterPage());
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
