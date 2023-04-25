import 'package:flutter/material.dart';
import 'package:EASY_HOUSE_FINDER/pages/utils/common_toast.dart';
import 'package:EASY_HOUSE_FINDER/service/firestore_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    var repeatPasswordController = TextEditingController();

    _registerHandler() async {
      var username = usernameController.text;
      var password = passwordController.text;
      var repeatPassword = repeatPasswordController.text;
      if (username.isEmpty || password.isEmpty) {
        CommonToast.showToast('Username or password is not empty!!');
        return;
      }
      if (password != repeatPassword) {
        CommonToast.showToast('Two type password is not same');
        return;
      }

      var params = {'username': username, 'password': password};
      var res = await FirestoreService.register(username, password);
      CommonToast.showToast('Resgiter Success!');
      Navigator.pushNamed(context, 'login');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Please Input Username',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Please Inut Password',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: repeatPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Please Confirm Password',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _registerHandler(),
              child: const Text('Register'),
            ),
            Row(
              //Sets the alignment of subcomponents in the main axis direction
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Has Account，'),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, 'login');
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: const Text('Go Login~'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
