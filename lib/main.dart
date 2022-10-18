import 'package:applianceflutter/model/type_appliance.dart';
import 'package:applianceflutter/service/type_appliance_service.dart';
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
  @override
  void initState() {
    super.initState();
    typeApplianceService = new TypeApplianceService();
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:FutureBuilder(
              future: typeApplianceService.fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

        
          for(int i=0;i<snapshot.data!.length+1;i++)
          {
return Text(snapshot.data![i+1].libelle);
          }
                  
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
