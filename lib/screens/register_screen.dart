
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

                children: [ const SizedBox( height :130),
                  Text(
                  'Sign-Up',
                  style: GoogleFonts.inter(
                      fontSize: 52, color: Colors.black,fontWeight: FontWeight.bold),
                         ),
                  const SizedBox(
                    height: 50,
                  ),const SizedBox( height :10),
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
                          ), hintText: 'Your email'),
                    ),
                  ),
                  const SizedBox( height :40),Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: password,
                      /*obscureText: true,*/
                      decoration:InputDecoration(
                          filled: true,
                          fillColor: const  Color.fromARGB(255, 204, 213, 238),
                          prefixIcon: const Icon(
                              Icons.lock
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ), hintText: 'Your password'),
                    ),
                  ),const SizedBox( height :40),
                  //button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 83, 114, 218)),
                        ),
                        onPressed: () => {
                          authService.createUserWithEmailandPassWord(email.text, password.text),
                          Navigator.pushNamed(context,'/login')

                        },
                        child: const Text(
                          'S U B M I T',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],

        ),
      ),
    );
  }
}
