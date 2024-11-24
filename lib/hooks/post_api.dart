import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApiExample extends HookWidget {
  @override
  Widget build(BuildContext context) {

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState<bool>(false);
    final loginMessage = useState<String>('');


    Future<void> login(String email, String password) async {
      isLoading.value = true;

      final url = Uri.parse('https://dummyjson.com/auth/login');
      final headers = {'Content-Type': 'application/json'};
      final body = json.encode({
        'username': email,
        'password': password,
      });

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print(response.body);
        // Handle success (parse token or user data)
        var responseData = json.decode(response.body);
        loginMessage.value = "Login successful! Welcome, ${responseData['firstName']} ${responseData['lastName']}";
        // You can store the token in secure storage or navigate to the home screen
      } else {
        // Handle login failure
        loginMessage.value = "Login failed: ${json.decode(response.body)['message']}";
      }

      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login API Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
              onPressed: () {
                final username = emailController.text;
                final password = passwordController.text;

                if (username.isNotEmpty && password.isNotEmpty) {
                  login(username, password); // Call the login function
                } else {
                  loginMessage.value = "Please enter username and password!";
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              loginMessage.value,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
