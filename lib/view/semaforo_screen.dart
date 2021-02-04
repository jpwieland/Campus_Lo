import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mundo_lo/view/samaforo_program_screen.dart';

class SemaforoScreen extends StatelessWidget {


  String url = 'http://192.168.100.121/?';
  bool estadoAmarelo=false;
  bool estadoVerde = false;
  bool estadoVermelho=false;

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
    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("lib/assets/fundo.png"), fit: BoxFit.cover,),
              ),
            ),
            new Column(
              children: <Widget>[
                // Flexible(
                //   flex:   10,
                //   child: Container(),),
                Container(height: 120,),
                Container(
                  width:120.0,
                  //color: Colors.black26,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(16.0),
                    color: Colors.black26,
                  ),
                  child: Column(
                    children: <Widget>[
                      Semantics(
                        label: "botão Luz Vermelha",
                        child: RawMaterialButton(
                          onPressed: () {
                            estadoVermelho? desligaVermelho():ligaVermelho();
                          },
                          elevation: 2.0,
                          fillColor: Colors.red,
                          //child: ,
                          padding: EdgeInsets.all(50.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      Container(height: 10,),
                      Semantics(
                        label: "botão Luz Amarela",

                        child: RawMaterialButton(
                          onPressed: () {
                            estadoAmarelo? desligaAmarelo():ligaAmarelo();

                          },
                          elevation: 2.0,
                          fillColor: Colors.yellow,
                          //child: ,
                          padding: EdgeInsets.all(50.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      Container(height: 10,),
                      Semantics(
                        label: "botão Luz verde",

                        child: RawMaterialButton(
                          onPressed: () {

                            estadoVerde? desligaVerde():ligaVerde();


                          },
                          elevation: 2.0,
                          fillColor: Colors.green,
                          //child: ,
                          padding: EdgeInsets.all(50.0),
                          shape: CircleBorder(),
                        ),
                      )
                    ],
                  ),

                ),
                Container(height:30),
                MaterialButton(
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyanAccent)
                    ),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SemaforoProgramaScreen()));
                    },
                    child: Text("Programa ae!",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
                    color: Colors.deepPurpleAccent,
                    padding:EdgeInsets.all(20.0)

                )


                // Flexible(
                //   flex: 4,
                //   child:GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(builder: (context) => SelecionarFazendeiroScreen()));
                //       },
                //       child: Image.asset("lib/view/assets/botao-continuar.png",semanticLabel: "Continuar",)
                //   )
                //   ,
                // ),

              ],
              //child: new Text("Hello background"),
            )
          ],
        )
    );
  }

}
