

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/models/home_screen_model.dart';
import 'package:project2/service.dart/home_screen_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Api with custom model")),
      ),
      body: FutureBuilder(
          future: getApi(),
          builder: (context, AsyncSnapshot<List<HomeScreenmodel>> snapshot) {
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                         const Text('Id:' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        Text(snapshot.data![index].id.toString(),style: TextStyle(fontSize: 18),),
                        SizedBox(height: 5,),
                        const Text('Title:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        Text(snapshot.data![index].title,style: TextStyle(fontSize: 18),),
                         SizedBox(height: 5,),
                        const Text('Url:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        Text(snapshot.data![index].url,style: TextStyle(fontSize: 18),),
                        
                         SizedBox(height: 5,),
                        const Text('ThumbnaiUrl:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        Text(snapshot.data![index].thumbnailUrl,style: TextStyle(fontSize: 18),),
                        
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
