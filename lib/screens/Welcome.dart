import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/pancake_raspberry.jpeg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/images/pancake_raspberry.JPG'),
                fit: BoxFit.fill,

              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Explore new healthy recipes and a more balanced way of living',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 240,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(150, 40)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 83, 114, 218)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: TextButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          'C R E A T E  A C C O U N T',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
