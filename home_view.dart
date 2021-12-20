import 'package:flutter/material.dart';
import 'package:todoapp/views/todo_detail_view.dart';
import 'package:todoapp/views/create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: InkWell(
          onTap: (){
            showModalBottomSheet(
              context: (context),
               builder: (context){
              return ListView(
                children: const [
                  CompletedTodotile(), 
                  CompletedTodotile(),
                  CompletedTodotile(),
                  CompletedTodotile(),
                  CompletedTodotile(),
                  CompletedTodotile(),
                  CompletedTodotile(),
                  CompletedTodotile(),

                ],);
               
            }
          );
          },
          child: Container(
            height: 50,
            margin:const EdgeInsets.all(16) ,
            padding:const EdgeInsets.all( 15),
            decoration:BoxDecoration(
              color:Colors.black12,
              borderRadius: BorderRadius.circular(5),
               ) ,
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:const [
                      Icon(Icons.check_circle_rounded),
                      SizedBox(
                        width: 10),
                     Text('Completed'),
                     Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                 const Text('24'),
                ],
                   

               ),
            ),
        ),),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const CreateTodoVeiw();

            }
            )
            );
          },
           child:const Icon(Icons.add),
        ),
       appBar: AppBar(
         leading: const Padding(
           padding:  EdgeInsets.all(8.0),
           child:  CircleAvatar(
             foregroundImage:AssetImage("assets/me.jpg"),
           ),
         ), 
         title: const Text('My Tasks',style: TextStyle(color: Colors.black)),
         foregroundColor: Colors.black,
         backgroundColor: Colors.white,
         elevation: 0,
         
         actions: [
           IconButton(onPressed: (){}, icon:const Icon(Icons.sort)),
           IconButton(onPressed: (){}, icon:const Icon(Icons.search))
    
           
         ],
       ),
       body: ListView(
        children:const[
          Todotile(
            title:'plan a trip to Ghana' ,
            subtitle: 'Take the entire class to Ghana by nkwanta road '),
          Todotile(
            title:'plan a trip to Ghana' ,
            subtitle: 'Take the entire class to Ghana by nkwanta road '),
          
            

        ]
       )
        ),
    );
  }
}

class Todotile extends StatelessWidget {
 const  Todotile({
    Key? key,required this.title, required this.subtitle})
   : super(key: key);
  final String title;
  final String subtitle;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return  DetailVeiw(title: title,subtitle: subtitle);

        }));

      },
      child: Card(
        elevation: 4,
        child:ListTile(
          leading: const  Icon(Icons.check_circle_outlined),
          title: Text(
            title,
          style:const TextStyle(fontWeight: FontWeight.bold),
          ),
          
          subtitle: Text(  
            subtitle,maxLines: 3,overflow: TextOverflow.fade,
            
    
            ),
          trailing: TextButton.icon(
            onPressed: (){},
            icon:  const Icon(Icons.notifications),
            label:const Text('Yesterday')),
        )
        
        ),
    );
  }
}
class CompletedTodotile extends StatelessWidget {
 const CompletedTodotile({
    Key? key})
   : super(key: key);

  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const DetailVeiw(title: 'Trip to Tamale', subtitle: 'This is a copmleted trip' );

        }));

      },
      child: Card(
        elevation: 4,
        child:ListTile(
          leading: const  Icon(Icons.check_circle_outlined),
          title:const Text(
            'Trip to tamale',
          style: TextStyle(fontWeight: FontWeight.bold),
          ),
          
          subtitle:const Text('This is a completed trip',  
            maxLines: 3,
            overflow: TextOverflow.fade,
            
    
            ),
          trailing: TextButton.icon(
            onPressed: (){},
            icon:  const Icon(Icons.notifications),
            label:const Text('Yesterday')),
        )
        
        ),
    );
  }
}
 