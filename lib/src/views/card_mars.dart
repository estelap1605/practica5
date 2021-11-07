import 'package:api_nasa/src/models/model_mars.dart';
import 'package:flutter/material.dart';

class CardMars extends StatelessWidget {
  final MarsModel mars;
  const CardMars({Key? key, required this.mars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0.0,5.0),
            blurRadius: 2.5
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
         Container(
          child: FadeInImage(
          //referencia de una carga de imagen gif
            placeholder: AssetImage('assets/activity_indicator.gif'),
            image: NetworkImage('${mars.img_src}'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
        Opacity(opacity: .5,
        child: Container(
          padding: EdgeInsets.only(left: 10.0),
          height: 60.0,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(mars.earth_date!, style: TextStyle(color: Colors.white,fontSize: 12.0),),
              Text('welcome to sol: ${mars.sol}',style: TextStyle(color: Colors.white, fontSize: 12.0),),
              MaterialButton(onPressed: (){
                Navigator.pushNamed(context, '/detail',
                arguments: {
                  'img_src' : mars.img_src,
                  'earth_date': mars.earth_date,
                  'sol' : mars.sol,
                });
              },
              child: Icon(Icons.chevron_right, color: Colors.white),
              )
            ],
          ),
          )
          ),
        
        ]
      ),
      ),
    );
  }
}