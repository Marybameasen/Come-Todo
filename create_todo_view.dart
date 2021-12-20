import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CreateTodoVeiw extends StatefulWidget {
  const CreateTodoVeiw({ Key? key }) : super(key: key);

  @override
  _CreateTodoVeiwState createState() => _CreateTodoVeiwState();
}

class _CreateTodoVeiwState extends State<CreateTodoVeiw> {
  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey _formkey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const Text('Create a Todo'),
          backgroundColor: Colors.white60,
          ), 
          body:Form(
            key: _formkey,
            child:  ListView(
              padding:const EdgeInsets.all(15),
            children: [ 
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle:TextStyle(fontWeight: FontWeight.bold), 
                  hintText: 'please enter a title '),
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter a title';
                  }  }
              ),
             const SizedBox(
               height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Discription',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'please describe your task',
                ),
                keyboardType: TextInputType.multiline,
                validator: (value){
                  if(value!.isEmpty){
                    return'Please enter a date';
                  }
                  else if(value == DateFormat.yMMMd().format(DateTime.now()) && _timeController.text==TimeOfDay.now().format(context)) {


                  }
                },
              ),
              const SizedBox(height: 10),
                TextFormField(
                  onTap: ()=>showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) => setState((){
                     _timeController.text=value!.format(context);
                  })),
                  
                  controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold), 
                  hintText: 'Please enter a time',

                ),
                keyboardType: TextInputType.datetime,
                 

                ),
                const SizedBox(
                  height: 10,
                  ),
                  TextFormField(
                    onTap:() => showDatePicker(
                      context: context, initialDate: DateTime.now(), firstDate : DateTime.now(),  
                       lastDate: DateTime.now().add(const Duration(days: 365))).then((value) {
                         setState(() {
                          _dateController.text=DateFormat.yMMMd().format(value!);
                         });
                       }) ,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText:'Date',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Please enter a date',

                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                 child: const Text(
                   'Create',
                   style: TextStyle(fontWeight: FontWeight.bold),


                 ),
                 style: TextButton.styleFrom(
                   primary: Colors.white,backgroundColor: Colors.green),
                  
                 ),
            ],
              ),
          )
      ),
    );
    
  }
}