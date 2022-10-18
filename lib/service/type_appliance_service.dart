import 'dart:convert';

import '../model/type_appliance.dart';
import 'package:http/http.dart' as http;
// ignore: non_constant_identifier_names
class TypeApplianceService{

Future<List> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/typeappliance'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   var data=  jsonDecode(response.body);//           typeAappliance.fromJson();
   List result=data.map((e)=>typeAappliance.fromJson(e)).toList();
   
   print(result);
   return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
}
