import 'package:flutter/material.dart';
import 'package:alumni_connect/constants/routes.dart';
import 'package:alumni_connect/pages/add_post/add_post_page.dart';
import 'package:alumni_connect/pages/add_post/create_jobposting_page.dart';
import 'package:alumni_connect/pages/authentication/login_page.dart';
import 'package:alumni_connect/pages/authentication/signup_detail_page.dart';
import 'package:alumni_connect/pages/authentication/signup_page.dart';
import 'package:alumni_connect/pages/chat/chat_page.dart';
import 'package:alumni_connect/pages/home/comments_page.dart';
import 'package:alumni_connect/pages/home/home_screen.dart';
import 'package:alumni_connect/pages/profile/profile_page.dart';
import 'package:alumni_connect/pages/root_page.dart';
import 'package:alumni_connect/pages/serach/search_page.dart';
import 'package:alumni_connect/services/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'alumni_connect',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const AuthenticationWrapper(),
      routes: {
        loginRoute: (context) => const LogInPage(),
        signupRoute: (context) => const SignUpPage(),
        rootRoute: (context) => const RootPage(),
        signupDetailRoute: (context) => const SignupDetailPage(),
        homeRoute: (context) => const HomeScreen(),
        searchRoute: (context) => const SearchPage(),
        chatRoute: (context) => const ChatPage(),
        addPostRoute: (context) => const AddPostPage(),
        postCommentRoute: (context) => const CommentsPage(),
        profileRoute: (context) => const ProfilePage(),
        createjobpostingRoute: (context) => const CreatejobpostingPage(),
      },
    ),
  );
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              return const RootPage();
            } else {
              return const LogInPage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
