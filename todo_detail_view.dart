import 'package:flutter/material.dart';

class DetailVeiw extends StatelessWidget {

  const DetailVeiw({ Key? key, required this.title,required this.subtitle}) : super(key: key);

final String title;
final String subtitle;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          iconTheme: const IconThemeData(color:Colors.black ),
          backgroundColor: Colors.white60,
          centerTitle: true,
          title: const Text(
            'Your Todo',
            style: TextStyle(color: Colors.black),
          ),
          ),
          body: ListView(
           children: [
             Text(title,style:const  TextStyle(fontWeight: FontWeight.bold,)),
            const SizedBox(height: 20,),
             Text(subtitle)  
           ], 
          ),
      
    )
    );
  }
}
