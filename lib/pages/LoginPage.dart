
import 'dart:ui';
import 'package:essayee/classes/language.dart';
import 'package:essayee/localizaion/language_const.dart';
import 'package:essayee/pages/main.dart';
import 'package:essayee/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';



class LoginPage extends StatefulWidget{
  LoginPage({Key key}) : super(key: key);
  _LoginPageState createState() => _LoginPageState ();
}
class _LoginPageState extends State<LoginPage>{
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool checkBoxValue=false;
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  alignment: Alignment.center,


                  child: Row(

                   mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [

                    Center(child:
                  Image(image: AssetImage('assets/logos/compaktor.png'),width: 150,
                    ),),

                      DropdownButton(
                          onChanged: (Language language) {
                            _changeLanguage(language);
                          },
                        icon: Icon(Icons.language),

                        items:Language.LanguageList(). map<DropdownMenuItem<Language>>
                          ((lang)=>DropdownMenuItem(
                            value:lang,

                            child: Row(
                              children: <Widget>[
                                Text(lang.flag),
                                Text(lang.name)

                              ]
                               ),
                                   )).toList(),
                      ),
                  ],

                )),
              Form(
                  key: _key,
                  child:
              Column(
              children:<Widget>[
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
                      obscureText: false,
                      autofocus:true,
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(25.0)),
                        labelText: getTranslated(context, 'Email'),
                        hintText: getTranslated(context, 'Email_hint'),
                                prefixIcon: Icon(Icons.email_outlined,color: Colors.deepPurpleAccent),
                      ),
                      validator: (value){
                        if (value.isEmpty) {
                          return getTranslated(context, 'required_field');
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]").hasMatch(value)){
                          return "Please enter a valid email";
                        }
                        return null;
                      }
                  )),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child:  TextFormField(
                      obscureText: true,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(25.0),

                            ),
                        labelText: getTranslated(context, 'mdp'),
                        hintText: getTranslated(context, 'mdp_hint'),
                            prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.deepPurpleAccent),

                      ),

                      validator: (value){
                        if (value.isEmpty) {
                          return getTranslated(context, 'required_field2');
                        }
                        if (value.length < 8){
                          return "Please enter a valid password";
                        }
                        return null;
                      }
                  ),

              ),
                Center(
                    child:Row(
                      children: <Widget>[
                        Checkbox(

                            value:checkBoxValue,
                            onChanged:(bool value) {
                              setState(() {
                                print(value);
                                checkBoxValue=value;
                              });
                            }
                        ),
                        Text(getTranslated(context, 'svm')),
                      ],
                    )
                ),
                Center(child:
              Container(
                margin: EdgeInsets.all(25),
                child: FlatButton(
                  child: Text(
                    getTranslated(context, 'cnx'),
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),


                  color: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    if(_key.currentState.validate()){
                      print("your data is submitted");
                    }
                  },
                ),
              )),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Icon(Icons.lock_outline),
               InkWell(
                  child:Text(getTranslated(context, 'mdp?')),
                   onTap: () =>Navigator.pushNamed(context,ResetPasswordRoute )
                   ),

                  ],
             ),




                Center(child:Padding
          ( padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child:SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {
                signWithGoogle();
              },
            )
                )
                ),
            ],

          )),
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

            ]
          )
        ]
      )

    );

  }

  void signWithGoogle() async {
   GoogleSignInAccount googleSignInAccount= await _googleSignIn.signIn();

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

