import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'dashboardContent.dart';

class dashboard extends StatefulWidget{
  _dashboardState createState() => _dashboardState();
}
class _dashboardState extends State <dashboard> {
  @override
  Widget build(BuildContext context) {
    double value=0;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.grey,
                  Colors.grey
                ],
                begin:Alignment.bottomCenter,
                end: Alignment.topCenter

              )
            ),
          ),
          SafeArea(child:
              Container(
                color:Colors.black54,
                width: 170.0,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children:<Widget> [
                    DrawerHeader(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Image(image: AssetImage('assets/logos/compaktor.png')),
                        SizedBox(height:20.0),

                          ],
                        )
                        ),
                    Expanded(child:ListView(
                      children: <Widget>[
                        ListTile(
                          onTap:(){},
                          leading: Icon(Icons.dashboard),
                          title: Text("Dashboard",style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.bold, ),),
                        ),
                        ListTile(
                          onTap:(){},
                          leading: Icon(Icons.shopping_cart),
                          title: Text('Sale',style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.bold, ),),
                        ),
                        ListTile(
                          onTap:(){},
                          leading: Icon(Icons.shopping_bag_rounded),
                          title: Text("Purchase",style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.bold, ),),
                        ),
                        ListTile(
                          onTap:(){},
                          leading: Icon(Icons.analytics_rounded),
                          title: Text("Stock",style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.bold, ),),
                        ),


                        ListTile(
                          onTap:(){},
                          leading: Icon(Icons.fiber_new),
                          title: Text("News",style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.bold, ),),
                        )

                      ],
                    ))
                  ],
                ),
              )

          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0,end: value,),
              duration: Duration(milliseconds: 500),
              builder: (_,double val,__){
                 return Transform(
                     transform:Matrix4.identity()
                     ..setEntry(3, 2, 0.001)
                     ..setEntry(0, 3, 200*val)
                     ..rotateY((pi/6)*val),
                    child: dashboardContent(),
                 );
          }
          ),
          GestureDetector(
            onTap:(){
              setState(() {
                value==0
                    ?value=1
                    :value=0;

              });
                },
          )

        ],



      ),
    );

  }

}
