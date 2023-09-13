import 'package:flutter/material.dart';
import 'package:two/components/button.dart';
import 'package:two/components/text_field.dart';
import 'package:two/components/image.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  // sharedPreferencesMethod() async {
  //   _sh = await _sharedPreferences;
  // }
  @override
  void initState() {
    // sharedPreferencesMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),

            // logo image

            // Icon(
            //   Icons.lock,
            //   size: 100,
            // ),

            Image.asset(
              'lib/images/logo.png',
              height: 150,
            ),

            const SizedBox(
              height: 40,
            ),

            // welcome text
            Text(
              'welcome to the jungle',
              style: TextStyle(color: Colors.grey[700], fontSize: 20),
            ),

            const SizedBox(
              height: 25,
            ),

            // email input text

            MyTextField(
              hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),

            // password input text

            MyTextField(
              hintText: 'password',
              controller: passwordController,
              obscureText: true,
            ),

            const SizedBox(
              height: 20,
            ),

            // button

            MyButton(
              onTap: () {
                
              },
              // onTap: signInUser,
              text: 'login',
            ),

            const SizedBox(
              height: 10,
            ),

            // forgot password

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forgot password ?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            // login with another ways

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  )),
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            // login with google or apple account

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MyImage(
                  imagePath: 'lib/images/google_logo.png',
                ),
                SizedBox(
                  width: 25,
                ),
                MyImage(
                  imagePath: 'lib/images/apple_logo.png',
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),

            // register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member ?'),
                const SizedBox(width: 4),
                GestureDetector(
                  // onTap: _register,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 40,
            ),
          ],
        ),
      )),
    );
  }

  // void signInUser() async {
  //   String email, password;
  //   email = emailController.text;
  //   password = passwordController.text;

  //   if (!RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(email)) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('the email is not a valid email'),
  //         );
  //       },
  //     );
  //     return;
  //   }

  //   if (password.length < 6) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('password should be more than 5 charachters'),
  //         );
  //       },
  //     );
  //     return;
  //   }

  //   List<Map> users =
  //       await db.readData("SELECT * FROM USER where EMAIL = '$email'");

  //   if (users.isEmpty) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('no such user with this email'),
  //         );
  //       },
  //     );
  //     return;
  //   }

  //   if (users[0]['PASSWORD'] != password) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text('uncorrect password'),
  //         );
  //       },
  //     );
  //     return;
  //   }

  //   Navigator.of(context).pop();
  //   Navigator.pushNamed(context, "/home");
  // }

  // void _register() {
  //   Navigator.of(context).pop();
  //   Navigator.pushNamed(context, "/register");
  // }
}
