import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;






class SemaforoProgramaScreen extends StatefulWidget {
  SemaforoProgramaScreen({Key key}) : super(key: key);

  @override
  _SemaforoProgramaScreenState createState() => _SemaforoProgramaScreenState();
  }







class _SemaforoProgramaScreenState extends State<SemaforoProgramaScreen> {
  TextEditingController _controller;


  String url = 'http://192.168.100.121/?';
  bool estadoAmarelo=false;
  bool estadoVerde = false;
  bool estadoVermelho=false;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }




  Future<void> rodarComandos(String palavrasComandos) async {
    List<String> comandos =palavrasComandos.split(";");
    print(comandos);
    desligaVerde();
    desligaVermelho();
    desligaAmarelo();
    for (var i=0; i<comandos.length; i++) {
       await traduzirComandos(comandos[i].replaceAll(' ', '').replaceAll("\n", ""));
       await Future.delayed(Duration(seconds: 1));

    }
  }



  Future<void> traduzirComandos(String comandoAtual) async {
    //sleep(Duration(seconds:2));

    //await Future.delayed(Duration(seconds: 1));


    if(comandoAtual=='aguarde'){
      await Future.delayed(Duration(seconds: 3));

    }
    else if (comandoAtual=="ligaAmarelo"){
      ligaAmarelo();

    }
    else if (comandoAtual=="desligaAmarelo"){
      await desligaAmarelo();

    }
    else if (comandoAtual=="piscaAmarelo"){
      await piscaAmarelo();

    }
    else if (comandoAtual=="ligaVermelho"){
      await ligaVermelho();

    }
    else if (comandoAtual=="desligaVermelho"){
      await desligaVermelho();

    }
    else if (comandoAtual=="piscaVermelho"){
      await piscaVermelho();

    }
    else if (comandoAtual=="ligaVerde"){
      await ligaVerde();

    }
    else if (comandoAtual=="desligaVerde"){
      await desligaVerde();

    }
    else if (comandoAtual=="piscaVerde"){
      await piscaVerde();

    }




  }

  Future <void> ligaAmarelo() async{
    var response = await http.get(Uri.encodeFull(url+"LED0=ON"));
    print(response);
    estadoAmarelo=true;
  }

  Future <void> desligaAmarelo() async{
    var response = await http.get(Uri.encodeFull(url+"LED0=OFF"));
    print(response);
    estadoAmarelo=false;
  }

  Future <void> piscaAmarelo() async{
    var response = await http.get(Uri.encodeFull(url+"LED0=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED0=ON"));
    response = await http.get(Uri.encodeFull(url+"LED0=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED0=ON"));
    response = await http.get(Uri.encodeFull(url+"LED0=OFF"));


    print(response);
    estadoAmarelo=false;
  }


  Future <void> ligaVermelho() async{
    var response = await http.get(Uri.encodeFull(url+"LED1=ON"));
    print(response);
    estadoVermelho=true;
  }

  Future <void> desligaVermelho() async{
    var response = await http.get(Uri.encodeFull(url+"LED1=OFF"));
    print(response);
    estadoVermelho=false;
  }

  Future <void> piscaVermelho() async{
    var response = await http.get(Uri.encodeFull(url+"LED1=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED1=ON"));
    response = await http.get(Uri.encodeFull(url+"LED1=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED1=ON"));
    response = await http.get(Uri.encodeFull(url+"LED1=OFF"));


    print(response);
    estadoVermelho=false;
  }

  Future <void> ligaVerde() async{
    var response = await http.get(Uri.encodeFull(url+"LED2=ON"));
    print(response);
    estadoVerde=true;
  }

  Future <void> desligaVerde() async{
    var response = await http.get(Uri.encodeFull(url+"LED2=OFF"));
    print(response);
    estadoVerde=false;
  }

  Future <void> piscaVerde() async{
    var response = await http.get(Uri.encodeFull(url+"LED2=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED2=ON"));
    response = await http.get(Uri.encodeFull(url+"LED2=OFF"));
    response = await http.get(Uri.encodeFull(url+"LED2=ON"));
    response = await http.get(Uri.encodeFull(url+"LED2=OFF"));

    print(response);
    estadoVerde=false;
  }


  @override
  Widget build(BuildContext context) {
    desligaAmarelo();
    desligaVerde();
    desligaVermelho();
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("lib/assets/fundo.png"), fit: BoxFit.cover,),
              ),
            ),
            Container(height:200.0),
            Column(
              children: <Widget>[
                Container(height: 110.0),
                Center(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child: TextField(
                      maxLines: 10,
                      controller: _controller,
                      onSubmitted: (String value) async{
                        await showDialog<void>(
                          context: context,
                          builder:(BuildContext context){
                            return AlertDialog(
                              title: const Text('comandos enviados!'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          }
                        );

                      },

                    ),
                  ),


                ),
                Container(height: 20,),
                MaterialButton(
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyanAccent)
                    ),

                    onPressed: (){
                      rodarComandos(_controller.text);
                    },
                    child: Text("submeter",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
                    color: Colors.deepPurpleAccent,
                    padding:EdgeInsets.all(20.0)

                ),
                Container(height: 30,),
                MaterialButton(
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyanAccent)
                    ),

                    onPressed: (){
                      desligaAmarelo();
                      desligaVermelho();
                      desligaVerde();
                    },
                    child: Text("Apagar Tudo",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
                    color: Colors.deepPurpleAccent,
                    padding:EdgeInsets.all(20.0)

                ),


              ],

            )
  ]
        )
    );
  }

}
