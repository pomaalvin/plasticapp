import 'package:plasticapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './menu.dart';
class historial extends StatefulWidget
{
  @override
  _historialState createState()=>   _historialState(userName);
  final String userName;
  historial(this.userName);

}

class _historialState extends State<historial>
{
  String email;
  @override
  _historialState(String email)
  {
    this.email=email;
  }
  String nombre="";

  final cantidades_controller= TextEditingController();
  final my_key=GlobalKey<FormState>();
  int select=0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: ()=>Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new menu(email) )),
      child: StreamBuilder(
          stream: Firestore.instance.collection("ventas2").snapshots(),
          builder: (context,snapshot) {
            return Scaffold(
              drawer: drawer(context, email),
              appBar: AppBar(backgroundColor: materialcolor1(),
                iconTheme: IconThemeData(color: materialcolor2()),
                title: Text("HISTORIAL DE VENTAS",
                  style: TextStyle(color: materialcolor2()),),),
              body: Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: materialcolor2(),),

                    itemBuilder: (context, index) {
                      if(snapshot.hasData)
                        {
                          return Material(
                            elevation: 10,
                            child: MaterialButton(
                              elevation: 10,
                              child: Container(
                                height: 80,
                                width: width*0.9,
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Cliente:"+snapshot.data.documents[index]["Cliente"],style: TextStyle(fontSize: 15,color: materialcolor2()),),
                                        Text("Producto:"+snapshot.data.documents[index]["Nombre"],style: TextStyle(fontSize: 15,color: materialcolor2()),),
                                      ],
                                    ),
                                    VerticalDivider(),
                                    Container(
                                      color: materialcolor2(),
                                      width: width*0.35,
                                      height: 80,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Cantidad:"+snapshot.data.documents[index]["Cantidad"].toString(),style: TextStyle(fontSize: 16,color: materialcolor1()),),
                                          Text("Precio:"+snapshot.data.documents[index]["Precio"],style: TextStyle(fontSize: 16,color: materialcolor1()),),
                                          Text("Total:"+snapshot.data.documents[index]["Total"].toString(),style: TextStyle(fontSize: 20,color: materialcolor1()),),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    },
                    itemCount: snapshot.data.documents.length,
                  )

              ),
            );
          }
      ),
    );
  }

}
