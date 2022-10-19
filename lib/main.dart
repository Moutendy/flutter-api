import 'package:applianceflutter/model/type_appliance.dart';
import 'package:applianceflutter/service/type_appliance_service.dart';
import 'package:applianceflutter/vue/add_type.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TypeApplianceService typeApplianceService;
 late List<typeAappliance> _type_appliance;

  @override
  void initState() {
    super.initState();

    _type_appliance = [];
    _getEmployees();
  }

   _getEmployees() {
    
    TypeApplianceService.getAppliance().then((type) {
      setState(() {
        _type_appliance = type;
      });
  
      print("Length: ${type.length}");
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView (
         scrollDirection: Axis.vertical,
         child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Column(children:_type_appliance.map((e) {
          return Column(
            children: [partagecommentaire(e)],
          );
        }).toList())
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _homeadd,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _homeadd()
  {
  
Navigator.push(context, PageRouteBuilder(pageBuilder: ((context, animation, secondaryAnimation) => AddType())));
    
  }


  
   Column _builButtonLike(Color color, IconData icon, String label,BuildContext context,String like,typeAappliance app) {
    return Column(

      children: [
     
        
        InkWell(
            onTap: () {
       
            },
            child: Row(
              children: [Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),
            Text('$like',
         style: TextStyle(fontSize: 18, color: Colors.pink),),
               Container(

          padding: EdgeInsets.only(bottom: 8),
          child:  Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: 'Delete Appliance',
          onPressed: () {
            _deletetypeappliance(app);

          },
        ),
   
      ],)
        )
              ],
            ),
        ),
       
      ],
    );
  }

     Widget partagecommentaire(typeAappliance type_appliance)
    {
      return Container(

      padding: const EdgeInsets.all(8),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_builButtonLike(Colors.pink, Icons.delete, "delete",context,type_appliance.libelle,type_appliance)],
      ),
    );
    }


    _deletetypeappliance(typeAappliance type_appliance) {

    TypeApplianceService.deleteTypeappliance(type_appliance.id).then((result) {
      if (result) {
        setState(() {
          _type_appliance.remove(type_appliance);
        });
        _getEmployees();
      }
    });
 
  }
}


