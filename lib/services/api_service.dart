
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Models/Models.dart';

class HttpService {
  final String apiId = 'ee3e06ee';
  final String apiKey = 'b4c64905376491daed848cb56de82e9f';
  final String url = 'https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=breakfast&app_id=ee3e06ee&app_key=b4c64905376491daed848cb56de82e9f&health=gluten-free';


  getRecipe() async {
    var response = await get(Uri.parse(url));

    if(response.statusCode == 200){
      debugPrint("${modelFromJson(response.body).hits?[0].recipe}");
      return modelFromJson(response.body);
    }else{
      return Model();
    }



  }


}