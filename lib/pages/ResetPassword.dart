import 'package:essayee/localizaion/language_const.dart';
import 'package:essayee/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResetPassword extends StatefulWidget{
  _ResetPasswordState createState()=>_ResetPasswordState();

}
 class _ResetPasswordState extends State<ResetPassword>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Column(

            children: <Widget>[
              Container(
                margin: EdgeInsets.all(40),
              child:Center(
                child:Image(image: AssetImage('assets/logos/compaktor.png'),
                )
              ),),





               Container(
                   margin: EdgeInsets.all(20),

                  child:  TextFormField(
                      obscureText: true,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(25.0)),
                        labelText: 'Email ',
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.deepPurpleAccent),

                      ),
                      validator: (value){
                        if (value.isEmpty) {
                          return 'Entrer votre Email';
                        }
                        return null;}
                  )
              ),
              Center(child:
              Container(
                margin: EdgeInsets.all(20),
                child: FlatButton(
                  child: Text(
                   "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(getTranslated(context, 'dnt?')),
              InkWell(
                  child:Text(getTranslated(context, 'login'),style: TextStyle(color: Colors.deepPurpleAccent)),
                  onTap: () =>Navigator.pushNamed(context,'/')
              ),]),),
            Container(
              margin: EdgeInsets.all(20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text("Created with ♥ by "),
                  InkWell(
                  child:Text(" Maps IT ©",style: TextStyle(color: Colors.deepPurpleAccent)),
                    onTap: _launchLink,
                    ),


                     ],
          ),)

        ],)

      );
  }
  void _launchLink() async {
    const url = "https://maps-it.com/";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Impossible de lancer le lien.";
    }
  }
 }



