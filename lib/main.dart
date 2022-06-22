import 'package:cookbook/homepage.dart';
import 'package:cookbook/screens/login_page.dart';
import 'package:cookbook/screens/register_screen.dart';
import 'package:cookbook/services/auth_service.dart';
import 'package:cookbook/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => const Wrapper(),
          '/login':(context) => LoginPage(),
          '/register':(context) => const RegisterScreen(),
        },
      ),
    );
  }
}
