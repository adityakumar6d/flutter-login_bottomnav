import 'package:flutter/material.dart';
import 'package:flutter_login_project/home_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'My App',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {},
              textColor: Colors.blue,
              child: const Text('Forgot Password'),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text('Login'),
                onPressed: () {
                  if (nameController.text == 'aditya' &&
                      passwordController.text == '12345') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Logged in"),
                    ));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  }
                },
              ),
            ),
            Row(
              children: [
                Text('Does not have an account'),
                FlatButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
