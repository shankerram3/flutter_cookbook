import 'package:cookbook/screens/homepage.dart';
import 'package:cookbook/screens/login_page.dart';
import 'package:cookbook/screens/register_screen.dart';
import 'package:cookbook/services/auth_service.dart';
import 'package:cookbook/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( // status bar color
    statusBarBrightness: Brightness.light,//status bar brightness
    statusBarIconBrightness:Brightness.light , //status barIcon Brightness
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
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
          primarySwatch: Colors.blue,
        ),

        initialRoute: '/',
        routes: {
          '/':(context) => const Wrapper(),
          '/login':(context) => LoginPage(),
          '/register':(context) => RegisterScreen(),
          '/homepage':(context)=> const HomePage(),
        },
      ),
    );
  }
}
