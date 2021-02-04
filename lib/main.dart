

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mundo_lo/view/home_screen.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(MyApp());
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'MundoDaLo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}