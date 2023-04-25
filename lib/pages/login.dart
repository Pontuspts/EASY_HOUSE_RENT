import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/common_toast.dart';
import 'package:EASY_HOUSE_FINDER/service/firestore_service.dart';
import 'package:EASY_HOUSE_FINDER/tools/storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  _loginHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      CommonToast.showToast('Username or password is not empty!');
      return;
    }

    var params = {'username': username, 'password': password};
    var res = await FirestoreService.login(username, password);
    if (res == null) {
      CommonToast.showToast('Username or password is not correct!');
    } else {
      await StorageUtil.saveUser(res);
    }
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
                labelText: 'Username', hintText: 'Please Input Username'),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: passwordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please Input Password',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(_showPassword
                        ? Icons.visibility_off
                        : Icons.visibility))),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          ElevatedButton(
              onPressed: () {
                _loginHandler();
              },
              child: const Text('Login')),
          Row(
            //Sets the alignment of subcomponents in the main axis direction
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No Account，'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'register');
                  },
                  child: const Text('Register~'))
            ],
          ),
        ]),
      ),
    );
  }
}
