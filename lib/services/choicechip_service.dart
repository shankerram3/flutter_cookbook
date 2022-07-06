import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DietChoiceChip extends StatefulWidget {
  const DietChoiceChip({Key? key}) : super(key: key);

  @override
  State<DietChoiceChip> createState() => _DietChoiceChipState();
}

class _DietChoiceChipState extends State<DietChoiceChip> {
  var color = Colors.transparent;
  bool selection = false;
  final List<String> preferences = [
    "alcohol",
    "celery",
    "crustacean",
    "dairy",
    "egg",
    "fish",
    "FODMAP",
    "gluten",
    "kosher",
    "lupine",
    "mollusk",
    "mustard",
    "no-oil",
    "peanut",
    "tree-nut",
    "sulfite",
    "wheat",
    "soy",
    "pork",
    "red-meat",
    "sesame",
    "shell-fish"
  ];

  buildChoiceList() =>
     GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
     crossAxisSpacing: 30,
     mainAxisExtent: 50,
     mainAxisSpacing: 0.10),
       itemCount: preferences.length,
       itemBuilder: (ctx,index) =>  FilterChip(
         selected: selection,
         label: Text(preferences[index]),
         backgroundColor: Colors.transparent,
         selectedColor: const Color.fromRGBO(107, 146, 245, 1),
         labelStyle: const TextStyle(color: Colors.black),
         shape: const StadiumBorder(side:BorderSide()),
         onSelected: (selected) {
           setState(() {
               selection = selected;
             },
           );
         },
       ),);



  @override
  Widget build(BuildContext context) {
    return buildChoiceList();
  }
}



/*
 buildChoiceList() {
    List<Widget> choices = [];
    for (var item in preferences) {
      choices.add(
        Container(
          padding: const EdgeInsets.all(2.0),
          child: FilterChip(
            selected: selection,
            label: Text(item),
            backgroundColor: Colors.transparent,
            selectedColor: const Color.fromRGBO(107, 146, 245, 1),
            labelStyle: const TextStyle(color: Colors.black),
            shape: const StadiumBorder(side:BorderSide()),

            onSelected: (selected) {
              setState(
                () {
                  selection = selected;

                },
              );
            },
          ),
        ),
      );
    }
    return choices;
  }
*/
