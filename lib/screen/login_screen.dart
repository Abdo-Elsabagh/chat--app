import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.asset(
                'assets/images/scholar.png',
                width: 100,
                height: 100,
              ),
              const Text(
                'Scholar Chat',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text('Email'),
                    hintText: 'Enter your Email'),
              ),
              const SizedBox(height: 10),
              const TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    label: Text('Password'),
                    hintText: 'Enter your Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  margin: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I havn\'t an account ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushReplacement(MaterialPageRoute(
                        //   builder: (context) => const RegisterView(),
                        // ));
                      },
                      child: const Text(
                        'Creat One!',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
