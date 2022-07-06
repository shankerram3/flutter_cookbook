import 'package:flutter/material.dart';

import '../services/choicechip_service.dart';

class DietPreferences extends StatefulWidget {
  const DietPreferences({Key? key}) : super(key: key);

  @override
  State<DietPreferences> createState() => _DietPreferencesState();
}

class _DietPreferencesState extends State<DietPreferences> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: const [
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'What foods would you like to avoid?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 39.0),
                child: Text(
                  'Explore new healthy recipes and a more balanced way of living',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(
                height: 40,
                thickness: 4,
                indent: 30,
                endIndent: 20,
                color: Colors.black,
              ),

            ],
          ),
          const Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: DietChoiceChip(),
            ),
          )
        ],
      ),
    );
  }
}
