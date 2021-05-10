
import 'package:essayee/pages/Dashboroard.dart';
import 'package:essayee/pages/LoginPage.dart';
import 'package:essayee/pages/ResetPassword.dart';
import 'package:essayee/pages/home.dart';

import 'package:essayee/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeRouter{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch (settings.name){
      case LoginPageRoute:
        return MaterialPageRoute(builder: (_)=>LoginPage());
      case ResetPasswordRoute:
        return MaterialPageRoute(builder: (_)=>ResetPassword());
      case homeRoute:
        return MaterialPageRoute(builder: (_)=>home());
      case dashboardRoute:
        return MaterialPageRoute(builder: (_)=>dashboard());

    }
  }
}
