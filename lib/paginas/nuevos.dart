import 'package:flutter/material.dart';
import 'package:plasticapp/main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
class nuevos extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _nuevosState();
}
class _nuevosState extends State<nuevos>
{

  final nombreControl= TextEditingController();
  final empControl= TextEditingController();
  final descripControl= TextEditingController();
  final cantiControl= TextEditingController();
  final Global_key= GlobalKey<FormState>();
  File image_mostrar;
  String nombre;
  String URL;
  Future image() async
  {
    File img=await ImagePicker.pickImage(source: ImageSource.camera);
    print(basename(img.path));

    setState(() {

      image_mostrar=img;
      nombre=basename(img.path);
    });
  }

  Future<String> sacarUrl() async{
    StorageReference ref= FirebaseStorage.instance.ref().child(nombre);
    StorageUploadTask uploadTask= ref.putFile(image_mostrar);
    var downurl= await(await uploadTask.onComplete).ref.getDownloadURL();
    URL=downurl.toString();
    Firestore.instance
        .collection('productos')
        .add({
      'Nombre': nombreControl.text,
      'Empresa': empControl.text,
      'Descripcion': descripControl.text,
      'Cantidad': cantiControl.text,
      'imagen':URL,

    });
    print(downurl.toString());
    return downurl.toString();
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    return Scaffold(

      appBar: AppBar(title: Text("AÑADIR",style: TextStyle(color: materialcolor2()),),backgroundColor: materialcolor1(),iconTheme: IconThemeData(color: materialcolor2()),),
      drawer: drawer(),
      body: Form(

        key: Global_key,
        child: Container(
          width: 500,
          height: heigth,
          child: ListView(

            children: <Widget>[
              Divider(color:  Colors.transparent,height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Material(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(0),

                        width: width*0.4,
                        height: width*0.4,
                        child: image_mostrar==null? Image.asset("assets/default_image.png",):new Image.file(image_mostrar),
                      ),
                    ),
                    onPressed:()
                    {image();},
                  )
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
                          decoration: InputDecoration(hintText:"Descripcion",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                          controller: descripControl,
                          validator: (value)
                          {
                            if(value.isEmpty)
                              return "Ingrese una Descripcion";
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
                          decoration: InputDecoration(hintText:"Cantidad",border: InputBorder.none,contentPadding: EdgeInsets.only(top:10,left: 20)),
                          keyboardType: TextInputType.number,
                          controller: cantiControl,
                          validator: (value)
                          {
                            if(value.isEmpty)
                              return "Ingrese una cantidad";
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
                        sacarUrl();

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
                                    Text("Producto añadido Correctamente"),
                                    Divider(color: Colors.transparent,),
                                    MaterialButton(
                                      child: Text("Aceptar"),
                                      onPressed: ()
                                      {
                                        Navigator.pushNamed(context,"/menu");
                                      },
                                    )
                                  ],
                                ),
                              )
                            );
                          }
                      );}
                    },
                  )))
                ],
              )






            ],
          ),
        ),

      ),
    );
  }
}

