import 'package:cookbook/screens/homepage.dart';
import 'package:cookbook/screens/Welcome.dart';
import 'package:cookbook/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/User_model.dart';
import 'screens/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_,AsyncSnapshot<User?>snapshot){
          if(snapshot.connectionState == ConnectionState.active ){
            final User? user = snapshot.data;
            return user == null ? const Welcome():const HomePage();
          }
          else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),
            ),
            );
          }
    }
  );
  }
}
