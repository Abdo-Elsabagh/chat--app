import 'package:chat_app/constanst.dart';
import 'package:chat_app/screen/home_screen.dart';
import 'package:chat_app/widgets/box_resigsterd.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResgisterScreen extends StatefulWidget {
  const ResgisterScreen({super.key});
  static String id = 'ResgisterScreen';
  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
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
                          'Sign Up',
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
                      keyboardType: TextInputType.emailAddress,
                      prefixIco: const Icon(Icons.email),
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
                    const SizedBox(height: 20),
                    CustomButton(
                      onTop: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );

                            await showDialog(
                              context: context,
                              builder: (context) => BoxResigster(
                                massage: 'Enjoy the app now',
                                icon: const Icon(Icons.check_circle,
                                    color: Colors.green, size: 60),
                                text: '"Registration Successful 😊"',
                              ),
                            );

                            Navigator.pushReplacementNamed(
                                context, ChatScreen.id);
                          } on FirebaseAuthException catch (e) {
                            String message = "";

                            if (e.code == 'email-already-in-use') {
                              message = "This email is already in use.";
                            } else if (e.code == 'weak-password') {
                              message = "The password is too weak.";
                            } else if (e.code == 'invalid-email') {
                              message = "The email address is not valid.";
                            } else {
                              message =
                                  "An unexpected error occurred: ${e.message}";
                            }
                            showDialog(
                              context: context,
                              builder: (context) => BoxResigster(
                                icon: const Icon(Icons.error,
                                    color: Colors.red, size: 60),
                                text: "Registration Failed 😢",
                                massage: message,
                              ),
                            );
                          } catch (e) {
                            showSnackBar(
                                context, 'there was an error', Colors.red);
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      },
                      textButton: 'Resgister',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already have an account ?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Sing In!',
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
