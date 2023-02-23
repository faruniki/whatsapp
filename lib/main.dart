import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends  StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("WhatsApp"),
            actions: [
              Icon(Icons.camera),
              Icon(Icons.search),
              Icon(Icons.line_weight_rounded)
            ],
            bottom: TabBar(tabs: [
              Text("CHAT"),
              Text("STATUS"),
              Text("PANGGILAN")
            ]),
          ),
          body: TabBarView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Icon(
                    Icons.person
                  ),
                ),
                title: Text("Nazib Akbar"),
                subtitle: Text("Halo! sedang apa?"),
            ),
            Text("Ini akan muncul di tab STATUS"),
            Text("Ini akan muncul di tab PANGGILAN")
          ],
        ),
        )
      ),
    );
  }
  
  // _widgetStatus(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: ,
  //     itemBuilder:
  //   )
  // }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center()
    );
  }
}

