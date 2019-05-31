import 'package:flutter/material.dart';
import 'package:plasticapp/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import './menu.dart';
class clientes extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _clientesState(userName);
  final String userName;
  clientes(this.userName);
}
class _clientesState extends State<clientes>
{
  String email;
  @override
  _clientesState(String email)
  {
    this.email=email;
  }

  final nombreControl= TextEditingController();
  final empControl= TextEditingController();
  final direccionControl= TextEditingController();
  final telControl= TextEditingController();
  final Global_key= GlobalKey<FormState>();
  File image_mostrar;
  String nombre;
  String URL;

  Future<String> sacarUrl(context) async{
    Firestore.instance
        .collection('clientes')
        .add({
      'Nombre': nombreControl.text,
      'Empresa': empControl.text,
      'Direccion': direccionControl.text,
      'Telefono': telControl.text,

    });
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

              title: Text("Exito!!"),
              backgroundColor: materialcolor2(),
              content: Container(
                height: 120,
                child: Column(
                  children: <Widget>[
                    Text("Cliente añadido Correctamente",style: TextStyle(color: materialcolor1()),),
                    Divider(color: Colors.transparent,),
                    MaterialButton(

                      color: materialcolor1(),
                      child: Text("Aceptar"),
                      onPressed: ()
                      {
                        Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new menu(email) ));
                      },
                    )
                  ],
                ),
              )
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: ()=>Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new menu(email) )),
      child: Scaffold(

          appBar: AppBar(title: Text("AÑADIR",style: TextStyle(color: materialcolor2()),),backgroundColor: materialcolor1(),iconTheme: IconThemeData(color: materialcolor2()),),
          drawer: drawer(context,email),
          body: Form(

            key: Global_key,
            child: Container(
              width: 500,
              height: heigth,
              child: ListView(

                  children: <Widget>[
                    Divider(color:  Colors.transparent,height: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 10,
                              child: Container(
                                  color: materialcolor2(),
                                  width: width*0.1,
                                  height: 40,
                                  child: Icon(Icons.playlist_add,color: materialcolor1(),)
                              ),),
                            Material(
                                elevation: 10,
                                child: Container(
                                    width: width*0.6,
                                    height: 40,
                                    color: materialcolor1(),
                                    child: TextFormField(
                                      cursorColor: materialcolor2(),
                                      decoration: InputDecoration(hintText:"Nombre",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                                      controller: nombreControl,
                                      validator: (value)
                                      {
                                        if(value.isEmpty)
                                          return "Ingrese un nombre";
                                      },
                                    ))),
                          ],
                        ),
                        Divider(color: Colors.transparent,height: 30,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 10,
                              child: Container(
                                  color: materialcolor2(),
                                  width: width*0.1,
                                  height: 40,
                                  child: Icon(Icons.work,color: materialcolor1(),)
                              ),),
                            Material(
                                elevation: 10,
                                child: Container(
                                    width: width*0.6,
                                    height: 40,
                                    color: materialcolor1(),
                                    child: TextFormField(
                                      cursorColor: materialcolor2(),
                                      decoration: InputDecoration(hintText:"Empresa",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                                      controller: empControl,
                                      validator: (value)
                                      {
                                        if(value.isEmpty)
                                          return "Ingrese una empresa";
                                      },
                                    ))),
                          ],
                        ),
                        Divider(color: Colors.transparent,height: 30,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 10,
                              child: Container(
                                  color: materialcolor2(),
                                  width: width*0.1,
                                  height: 40,
                                  child: Icon(Icons.mode_edit,color: materialcolor1(),)
                              ),
                            ),
                            Material(
                              elevation: 10,
                              child: Container(
                                  width: width*0.6,
                                  height: 40,
                                  color: materialcolor1(),
                                  child: TextFormField(
                                    cursorColor: materialcolor2(),
                                    decoration: InputDecoration(hintText:"Direccion",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                                    controller: direccionControl,
                                    validator: (value)
                                    {
                                      if(value.isEmpty)
                                        return "Ingrese una Direccion";
                                    },
                                  )),
                            ),
                          ],
                        ),
                        Divider(color: Colors.transparent,height: 30,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              elevation: 10,
                              child: Container(
                                  color: materialcolor2(),
                                  width: width*0.1,
                                  height: 40,
                                  child: Icon(Icons.looks_one,color: materialcolor1(),)
                              ),),
                            Material(
                              elevation: 10,
                              child: Container(
                                  width: width*0.6,
                                  height: 40,
                                  color: materialcolor1(),
                                  child: TextFormField(
                                    cursorColor: materialcolor2(),
                                    decoration: InputDecoration(hintText:"Telefono",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                                    keyboardType: TextInputType.number,
                                    controller: telControl,
                                    validator: (value)
                                    {
                                      if(value.isEmpty)
                                        return "Ingrese un Telefono";
                                    },
                                  )),
                            ),
                          ],
                        ),
                        Divider(color: Colors.transparent,height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                                elevation: 10,
                                child: Container(
                                    height: 35,
                                    width: width*0.30,
                                    child: MaterialButton(
                                      color: materialcolor2(),
                                      child: Text("Añadir",style: TextStyle(color: materialcolor1()),),
                                      onPressed: ()
                                      {

                                        if(Global_key.currentState.validate()){
                                          sacarUrl(context);
                                        }
                                      },
                                    )))
                          ],
                        )






                      ],
                    ),
                  ]),

            ),
          )),
    );
  }
}

