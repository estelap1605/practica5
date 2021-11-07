import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>; 
   
    return  
    
    Container(
      decoration: BoxDecoration(
         gradient: LinearGradient(
         colors: [Colors.purpleAccent, Colors.purple],
         stops: [0.5,0.5],
         begin: FractionalOffset.topRight,
         end: FractionalOffset.bottomLeft
         )
          ),
        child: ListView(
          children: [
           
            Card(
              elevation: 8.0,
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Welcome to Mars on',style: TextStyle(fontSize: 18.0)),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ${photo['earth_date']}', style: TextStyle(fontSize: 18.0)),
                    Text('Sol: ${photo['sol']}',style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              ),
              ),
               Opacity(
              opacity: 0.8,
              child: Container(
                 child: FadeInImage(
                      //referencia de una carga de imagen gif
              placeholder: AssetImage('assets/activity_indicator.gif'),
              image: NetworkImage('${photo['img_src']}'),
              fadeInDuration: Duration(milliseconds: 200),
                      ),
              ),
            ),
           
          ],
          
           )    
            
      );
    
  }
}