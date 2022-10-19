import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/type_appliance.dart';
import '../service/type_appliance_service.dart';

class AddType extends StatefulWidget {
  const AddType({super.key});

  @override
  State<AddType> createState() => _AddTypeState();
}

class _AddTypeState extends State<AddType> {
    late TextEditingController _typeNameController;
     @override
  void initState() {
    super.initState();
  _typeNameController=TextEditingController();
    _typeNameController.addListener(_printLatestValue);
  }

@override
void dispose() {
  // Clean up the controller when the widget is removed from the widget tree.
  // This also removes the _printLatestValue listener.
  _typeNameController.dispose();
  super.dispose();
}
  void _printLatestValue() {
  // print('Second text field: ${_typeNameController.text}');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ajouter Type"),
        ),
        body: ListView(
          children: [champ(),
           IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed:_addTypeappliance
          ),],
        ));
  }

Widget champ()
{
 Widget champs= Container(
  padding: const EdgeInsets.all(32),
    child: TextField(
          controller: _typeNameController,
           decoration: InputDecoration.collapsed(
                  hintText: "Type appliance",
                ),
        ),


);
return champs;
}

  _addTypeappliance() {
    typeAappliance typeappliance;
    if (_typeNameController.text
        .trim()
        .isEmpty) {
      print("Empty fields");
      return;
    }
   typeappliance=new typeAappliance(id: '', libelle: _typeNameController.text);
   
 TypeApplianceService.addType(typeappliance);
 
  }

}
