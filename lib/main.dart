// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:codenames_client/Controller/controller.dart';
import 'package:codenames_client/ingame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller(),
      lazy: false,
      child: MaterialApp(
        title: 'Codenames',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class SelectItem{
 final String value;
  final String name;
  SelectItem(this.value,this.name);
  @override
  String toString() => name;
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();
   static List<SelectItem> usStates =  <SelectItem>[
     SelectItem("AgentR", "Roter Agent"),
     SelectItem("AgentB", "Blauer Agent"),
     SelectItem("GCR", "Roter Geheimdienstchef"),
     SelectItem("GCB", "Blauer Geheimdienstchef")
  ];
  SelectItem selectedUsState = usStates[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Codenames',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _nameController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Hier dein Name bitte',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _ipController,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'IP-Adresse bitte hier eintragen (nur IP)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        child: Text(selectedUsState.name),
                        onPressed: () => {
                          showMaterialScrollPicker<SelectItem>(
                            context: context,
                            title: 'Wähle deine Rolle',
                            items: usStates,
                            selectedItem: selectedUsState,
                            onChanged: (value) =>
                                setState(() => selectedUsState = value),
                          )
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Controller>(context, listen: false)
                          .sendUserVeri(_nameController.text, selectedUsState.value,
                              _ipController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ingame()));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Los gehts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
