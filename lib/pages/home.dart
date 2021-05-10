import 'package:essayee/classes/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget{

    _homeState createState()=> _homeState();
}

class _homeState extends State<home>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("homePage"),
         actions: <Widget>[
           Center(child:

           Image(image: AssetImage('assets/logos/compaktor.png'))),
           Padding(padding: const EdgeInsets.all(8.0),
             child:DropdownButton<Language>(
               icon: Icon(
                 Icons.language,
                 color: Colors.white,
               ),
               onChanged: (Language language) {

               },
               items: Language.LanguageList()
                   .map<DropdownMenuItem<Language>>(
                     (e) => DropdownMenuItem<Language>(
                   value: e,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Text(
                         e.flag,
                         style: TextStyle(fontSize: 30),
                       ),
                       Text(e.name)
                     ],
                   ),
                 ),
               )
                   .toList(),
             ),
           ),
         ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _mainForm(context),
      ),

    );
  }
  Form  _mainForm(context){
    return Form(

      child:Column(
        children: <Widget>[
          TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return ("Entert votre nom");
                  // return DemoLocalization.of(context).translate('required_fiedl');
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
                hintText:"tapez nom",
              ),
            ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (val) {
              if (val.isEmpty) {
                return ("Entert votre email");
                // return DemoLocalization.of(context).translate('required_fiedl');
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
              hintText:"tapez votre email",
            ),
          ),


        ],
      )


    );
  }
}
