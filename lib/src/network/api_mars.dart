import 'package:api_nasa/src/models/model_mars.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiMars {
  var URL = Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY');

  Future<List<MarsModel>?> getMars() async {
   final response = await http.get(URL);
   if(response.statusCode == 200){
     var mars = jsonDecode(response.body)['photos'] as List;
     List<MarsModel> listMars = mars.map((photo) => MarsModel.fromMap(photo)).toList();
     return listMars;
   } else {
     return null;
   }
  }
}