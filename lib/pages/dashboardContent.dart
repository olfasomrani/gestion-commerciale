import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dashboardContent extends StatefulWidget{
  _dashboardContentState createState() => _dashboardContentState();
}
class _dashboardContentState extends State<dashboardContent>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('hello'),


      ),
      body:Center(
        child: Text('Bonjour'),
      ),


    );
  }
}
