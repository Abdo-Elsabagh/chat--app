import 'package:chat_app/constanst.dart';
import 'package:chat_app/screen/home_screen.dart';
import 'package:chat_app/screen/resigster_screen.dart';
import 'package:chat_app/widgets/box_resigsterd.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool isVisable = true;
  String? email;
  String? password;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColors,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      KLogo,
                      width: 100,
                      height: 100,
                    ),
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico'),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CstomFormTextFiled(
                      onChange: (data) {
                        email = data;
                      },
                      prefixIco: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      labeText: 'Email',
                      hinttext: 'Enter your Email',
                    ),
                    const SizedBox(height: 10),
                    CstomFormTextFiled(
                      onChange: (data) {
                        password = data;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      isVisible: isVisable,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon((isVisable)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded)),
                      prefixIco: const Icon(Icons.lock),
                      hinttext: 'Enter your Password',
                      labeText: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTop: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );

                            await showDialog(
                              context: context,
                              builder: (context) => BoxResigster(
                                massage: 'Enjoy the app now',
                                icon: const Icon(Icons.check_circle,
                                    color: Colors.green, size: 60),
                                text: '"Login Successful 😊"',
                              ),
                            );

                            Navigator.pushReplacementNamed(
                                context, ChatScreen.id);
                          } on FirebaseAuthException catch (e) {
                            //  print("ERROR CODE: ${e.code}");
                            String message = '';
                            if (e.code == 'user-not-found') {
                              message = 'No user found for that email.';
                            } else if (e.code == 'wrong-password') {
                              message =
                                  'Wrong password provided for that user.';
                            } else if (e.code == 'invalid-email') {
                              message = 'The email address is not valid.';
                            } else if (e.code == 'user-disabled') {
                              message = 'This user account has been disabled.';
                            } else if (e.code == 'too-many-requests') {
                              message =
                                  'Too many attempts. Please try again later.';
                            } else if (e.code == 'operation-not-allowed') {
                              message = 'Email/password login is not enabled.';
                            } else if (e.code == 'invalid-credential') {
                              message =
                                  'Invalid credential. Please check your login data.';
                            } else {
                              message =
                                  "An unexpected error occurred: ${e.message}";
                            }

                            await showDialog(
                              context: context,
                              builder: (context) => BoxResigster(
                                icon: const Icon(Icons.error,
                                    color: Colors.red, size: 60),
                                text: "Login Failed 😢",
                                massage: message,
                              ),
                            );
                          } catch (e) {
                            showSnackBar(
                                context, 'There was an error', Colors.red);
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      textButton: 'login',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "don't have an account ?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ResgisterScreen.id);
                            },
                            child: const Text(
                              'Creat One!',
                              style: TextStyle(
                                  color: Color(0xffC7EDE6), fontSize: 16),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
