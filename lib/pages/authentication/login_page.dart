import 'package:alumni_connect/constants/routes.dart';
import 'package:alumni_connect/pages/authentication/signup_page.dart';
import 'package:alumni_connect/pages/authentication/widget/text_field_input.dart';
import 'package:alumni_connect/services/auth/auth_exceptions.dart';
import 'package:alumni_connect/services/auth/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/appbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enter your email & Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Alumni Connect',
                      style: GoogleFonts.poppins(
                        fontSize: 39.0,
                        color: Color.fromARGB(255, 220, 209, 209),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const Divider(
                      height: 28,
                    ),
                    SizedBox(
                      child: TextFieldInput(
                        textEditingController: _emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email address',
                      ),
                    ),
                    const Divider(
                      height: 14,
                    ),
                    TextFieldInput(
                      textEditingController: _passwordController,
                      textInputType: TextInputType.text,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    const Divider(
                      height: 14,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // login
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        try {
                          await AuthService.firebase().logIn(
                            email: email,
                            password: password,
                          );
                          if (!mounted) return;
                          Navigator.of(context).popAndPushNamed(
                            rootRoute,
                          );
                        } on UserNotFoundException {
                          "User not found";
                        } on WrongPasswordException {
                          "Wrong password";
                        } on GenericAuthException {
                          'Authentication error';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          double.infinity,
                          56,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Colors.blue.shade800,
                      ),
                      child: const Text(
                        'LogIn',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const Divider(
                      height: 14,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Forgot your password? ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 176, 171, 171),
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Get help logging in.',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 176, 171, 171),
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Divider(
                      height: 30,
                      color: Colors.grey,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).popAndPushNamed(
                                  signupRoute,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
