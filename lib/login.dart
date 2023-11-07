import 'package:flutter/material.dart';
import 'homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isAllowedCollegeEmail(String email) {
    // Define a list of allowed college email domains
    List<String> allowedDomains = ['stu.bmcc.cuny.edu'];

    // Split the email address to get the domain
    String domain = email.split('@').last;

    // Check if the domain is in the allowed list
    return allowedDomains.contains(domain);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.teal]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 20),
            _inputField("Enter your student email", usernameController),
            const SizedBox(height: 20),
            _inputField("Password", passwordController, isPassword: true),
            const SizedBox(height: 30),
            _loginBtn(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/cuny2-removebg-preview.png'),
        const SizedBox(height: 10),
        const Text(
          "Welcome to the Wellness ",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Hub",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
        onPressed: () {
          String email;
          email = usernameController.text;

          if (isAllowedCollegeEmail(email)) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16)),
        child: const SizedBox(
            width: double.infinity,
            child: Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )));
  }
}
