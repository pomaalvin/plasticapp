import 'package:flutter/material.dart';
import 'package:plasticapp/main.dart';
import 'login.dart';
class menu extends StatefulWidget
{
  @override
  _menuState createState() => _menuState();

}
class _menuState extends State<menu>
{
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
       drawer: drawer(),
        appBar: AppBar(backgroundColor: materialcolor1(),iconTheme: IconThemeData(color: materialcolor2()),title: Text("MENU",style: TextStyle(color: materialcolor2()),),),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/fondo.png"),fit: BoxFit.fitWidth)),
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 100),
              child: Image.asset('assets/logo_progra.png',width: width*0.65,),
          ),
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 100,
                    minWidth: width*0.4,
                    color: materialcolor1(),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.add_shopping_cart,color: materialcolor2(),size:45),
                        Text("SELECCION DE\nPRODUCTOS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor2()))
                      ],
                    ),
                    onPressed: ()
                    {
                      Navigator.pushNamed(context, "/seleccion");
                    },
                  ),
                  Container(
                    width: width*0.1,
                  )
                  ,
                  MaterialButton(
                    height: 100,
                    minWidth: width*0.4,
                    color: materialcolor1(),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.group_add,color: materialcolor2(),size:45),
                        Text("NUEVOS\nCLIENTES",textAlign: TextAlign.center,style: TextStyle(color:materialcolor2()))
                      ],
                    ),
                    onPressed: ()
                    {
                    },
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 100,
                    minWidth: width*0.4,
                    color: materialcolor1(),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.history, color: materialcolor2(),size:45),
                        Text("HISTORIAL DE\nVENTAS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor2()))
                      ],
                    ),
                    onPressed: ()
                    {

                    },
                  ),
                  Container(
                    width: width*0.1,
                  ),
                  MaterialButton(
                    height: 100,
                    minWidth: width*0.4,
                    color: materialcolor1(),
                    child: Column(
                      children: <Widget>[
                        new Icon(Icons.library_add,color: materialcolor2(),size: 45,),
                        Text("NUEVOS\nPRODUCTOS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor2()),)
                      ],
                    ),
                    onPressed: ()
                    {
                      Navigator.pushNamed(context, "/nuevos");

                    },
                  ),
                ],
              )
            ],
          )
          )
        ],
      ),

      )



    );
  }

}
