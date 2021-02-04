import 'package:flutter/material.dart';
import 'package:mundo_lo/view/semaforo_screen.dart';

class HomeScreen extends StatelessWidget {


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
                Container(height: 30,),
                Image.asset(
                    "lib/assets/mundo_da_lo_cor.png",
                    semanticLabel: "Logo mundo da Lo",
                    height: 300.0,
                ),
                MaterialButton(
                  minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyanAccent)
                    ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SemaforoScreen()));

                  },
                  child: Text("Semáforo",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SemaforoScreen()));

                    },
                    child: Text("Piano",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SemaforoScreen()));
                    },
                    child: Text("Display",style: TextStyle(fontSize: 20.0,color: Colors.white,decorationColor:Colors.white ),),
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
