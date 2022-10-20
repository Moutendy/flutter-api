// ignore_for_file: unnecessary_new

import 'package:applianceflutter/model/type_appliance.dart';
import 'package:applianceflutter/service/type_appliance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/type_appliance.dart';

class UpdateAppliance extends StatefulWidget {
  UpdateAppliance({super.key, required this.type});
  final typeAappliance type;
  @override
  State<UpdateAppliance> createState() => _UpdateApplianceState(type);
}

class _UpdateApplianceState extends State<UpdateAppliance> {

  late TextEditingController _typeNameController;
late typeAappliance type;

  
  _UpdateApplianceState(this.type);

  @override
  void initState() {
    super.initState();
    _typeNameController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _typeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Type"),
        ),
        body: ListView(children: [
          champ(),
          IconButton(
              icon: Icon(Icons.add_a_photo), onPressed: () {
                _updateTypeappliance(this.type);
              },)
        ]));
  }

  Widget champ() {
    Widget champs = Container(
      padding: const EdgeInsets.all(32),
      child: TextField(
        controller: _typeNameController,
        // ignore: prefer_const_constructors
        decoration: InputDecoration.collapsed(
          hintText: type.libelle.toString(),
        ),
      ),
    );
    return champs;
  }

  _updateTypeappliance( typeAappliance typeappliance) {
 typeAappliance typeappliance1;
   print(typeappliance.libelle.toString());

    if (_typeNameController.text
        .trim()
        .isEmpty) {
      print("Empty fields");
      return;
    }
    typeappliance1=new typeAappliance(id: typeappliance.id.toString(), libelle: _typeNameController.text);
   
     TypeApplianceService.updateType(typeappliance1);
     TypeApplianceService.getAppliance();
  }
}
