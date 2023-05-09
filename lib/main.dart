import 'dart:convert';

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
      home: const MyHomePage(),
    );
  }
}
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: DefaultTabController(
  //       length: 3,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: Text("WhatsApp"),
  //           actions: [
  //             Icon(Icons.camera),
  //             Icon(Icons.search),
  //             Icon(Icons.line_weight_rounded)
  //           ],
  //           bottom: TabBar(
  //             tabs: [
  //             Text("CHAT"),
  //             Text("STATUS"),
  //             Text("PANGGILAN")
  //           ]),
            
  //         ),
  //         body: TabBarView(
  //           children: [
  //             ListTile(
  //               leading: CircleAvatar(
  //                 child: Icon(
  //                   Icons.person
  //                 ),
  //               ),
  //               title: Text("Nazib Akbar"),
  //               subtitle: Text("Halo! sedang apa?"),
  //           ),

  //           // _widgetStatus(context),

  //           Text("Ini akan muncul di tab PANGGILAN")
  //         ],
  //       ),
  //       )
  //     ),
  //   );
  // }

  // _widgetStatus(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: ,
  //     itemBuilder: ,
  //   )
  // }
  
  // _widgetStatus(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: ,
  //     itemBuilder:
  //   )
  // }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List chats = [];
  Future<void> _getChats() async {
    //ambil data chats
    var url = Uri.http("localhost", "/whatsapp/chats.php", {'q': '{http}'});

    var response = await http
      .get(url, headers: {"Access-COntrol-Allow-Methods": "POST, OPTIONS"});

    if (response.statusCode == 200) {
      setState(() {
        chats = json.decode(response.body);

        print(chats);
      });
    } else {
      throw Exception('Data gagal di ambil!');
    }
  }

  @override
  void initState() {
    _getChats();
    super.initState();
  }

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
            bottom: TabBar(
              tabs: [
              Text("CHAT"),
              Text("STATUS"),
              Text("PANGGILAN")
            ]),
            
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return
                  InkWell(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(chats[index]["nama"]),
                      subtitle: Text(chats[index]["chat"]),
                    ),
                    onTap: () {
                      print("Chat di tekan!");
                    },
                  );
                },
            ),

            _widgetStatus(context),

            Text("Ini akan muncul di tab PANGGILAN")
          ],
        ),
        )
      ),
    );
  }

  _widgetStatus(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.person
            ),
          ),
          title: Text("Nazib Akbar"),
          subtitle: Text("30 Minutes Ago"),
        );
      }
    );
  }
}

