import 'package:flutter/material.dart';
import 'package:forumapp/controllers/authentication.dart';
import 'package:forumapp/views/login_page.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              'Register Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            InputWidget(hintText: 'Name', controller: _nameController, obscured: false),
            SizedBox(height: 20),
            InputWidget(
              hintText: 'Username',
              controller: _usernameController,
              obscured: false,
            ),
            SizedBox(height: 20),
            InputWidget(hintText: 'Email', controller: _emailController, obscured: false),
            SizedBox(height: 20),
            InputWidget(
              hintText: 'Password',
              controller: _passwordController,
              obscured: true,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              onPressed: () async {
                await _authentication.register(
                  name: _nameController.text.trim(),
                  username: _usernameController.text.trim(),
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                );
              },
              child: Obx(() {
                return _authentication.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Register');
              }),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.off(() => LoginPage());
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
