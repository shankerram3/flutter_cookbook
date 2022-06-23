import 'package:cookbook/homepage.dart';
import 'package:cookbook/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Login',
                style: GoogleFonts.inter(
                    fontSize: 52, color: Colors.black,fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),


             // EMAIL
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: email,
                  decoration:InputDecoration(
                      filled: true,
                      fillColor: const  Color.fromARGB(255, 204, 213, 238),
                      prefixIcon: const Icon(
                          Icons.mail
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.0),
                      ), hintText: 'email'),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration:
                    InputDecoration(
                        filled: true,
                        fillColor: const  Color.fromARGB(255, 204, 213, 238),
                        prefixIcon: const Icon(
                        Icons.lock
                      ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ), hintText: 'password'),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),

              Text(
                'Forgot password?',
                style: GoogleFonts.inter(
                    fontSize: 12, color: Colors.blueGrey,fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 25.0),
            //Sign-in Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 83, 114, 218)),
                    ),
                    onPressed: () async {

                      var credential = await authService.signInWithEmailAndPassword(email.text, password.text);
                      debugPrint(credential?.id);

                    },
                    child: const Text(
                      'L O G I N',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Not a member?'),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/register');
                    },
                    child: const Text('  Signup!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
