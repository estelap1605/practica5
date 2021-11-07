import 'package:api_nasa/src/models/model_mars.dart';
import 'package:api_nasa/src/network/api_mars.dart';
import 'package:api_nasa/src/views/card_mars.dart';
import 'package:flutter/material.dart';

class MarsScreen extends StatefulWidget {
  MarsScreen({Key? key}) : super(key: key);

  @override
  _MarsScreenState createState() => _MarsScreenState();
}

class _MarsScreenState extends State<MarsScreen> {
 
 ApiMars? apiMars;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiMars = ApiMars();
  }
 
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: 
       FutureBuilder(
        future: apiMars!.getMars(),
        //el asyncsnapshot es la represaentacion de los datos que estamos consumiendo de la api
        builder: (BuildContext context, AsyncSnapshot<List<MarsModel>?> snapshot){
          if( snapshot.hasError){
            return Center(child: Text('Hay un error en la peticion'),);
          }
          else {
            if( snapshot.connectionState == ConnectionState.done){
              //el listpopularmovies, parseara el data de la peticion, recordar que el data ya es una lista
              return _listMars(snapshot.data);
            }else {
              //en caso de que se este procesando la solicitud, es mejor indicar al usuario que esta pasando 
              return CircularProgressIndicator();
            }
          }
        }
        ),
          
    );
    //Future builder retorna un widget
  }
  Widget _listMars(List<MarsModel>? planet){
   return  ListView.separated(
       itemBuilder: (context, index){
         MarsModel mars = planet![index];
         
     return  CardMars(mars: mars);
       }, 
       separatorBuilder: (_,__) => Divider(height: 10,),
       //indica el numero de elementos existentes en la lista, forzamos a que movies tenga un valor para poder accesar a su propiedad length
        itemCount: planet!.length
   );
  }
}