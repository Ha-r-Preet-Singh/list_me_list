import 'package:flutter/material.dart';
import 'package:list_in_list_intro_46/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Constants.transactions;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data[index]["date"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("\$${data[index]["amt"]}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:( data[index]["expense"] as List<Map<String,dynamic>>).length,
                  itemBuilder: (_, childIndex) {
                    var childData = data[index]["expense"][childIndex] as Map<String,dynamic>;


                    return ListTile(
                      title: Text(childData["title"]),
                      subtitle: Text(childData["subtitle"]),
                      trailing: Text(childData["amt"]),
                    );


                },),
              ],
            );

        },),
      ),
    );
  }
}

