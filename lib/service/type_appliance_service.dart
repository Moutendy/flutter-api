import 'dart:convert';

import '../model/type_appliance.dart';
import 'package:http/http.dart' as http;
// ignore: non_constant_identifier_names
class TypeApplianceService{

Future<List> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/typeappliance'));

  if (response.statusCode == 200) {
  
   var data=  jsonDecode(response.body);
   List result=data.map((e)=>typeAappliance.fromJson(e)).toList();
   
   print(result);
   return result;
  } else {
   
    throw Exception('Failed to load album');
  }
}

static Future<List<typeAappliance>>getAppliance() async {
final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/typeappliance'));

  if (response.statusCode == 200) {
 
      List<typeAappliance> list = parseResponse(response.body);
   
  
   return list;
  } else {
 
    throw Exception('Failed to load album');
  }
}


  static List<typeAappliance> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    print(parsed);
    return parsed.map<typeAappliance>((json) => typeAappliance.fromJson(json)).toList();
  }


  static Future<bool> addType(typeAappliance typeAppliance) async {
  
    try {
      var map = Map<String, dynamic>();
      map['libelle']=typeAppliance.libelle;
      final response = await http.post(Uri.parse("http://127.0.0.1:8000/api/typeappliance"), body: map);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }


  }


  static deleteTypeappliance(String typeApplianceId) async
  {var string ="http://127.0.0.1:8000/api/typeappliance/";
   final   parsed=json.decode(typeApplianceId);
        try {
         
      print(parsed);
      // ignore: prefer_interpolation_to_compose_strings
      final response = await http.delete(Uri.parse(string +parsed));
      print('deleteEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        print(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  }

