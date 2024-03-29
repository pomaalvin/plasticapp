import 'package:plasticapp/main.dart';
import 'package:flutter/material.dart';
class seleccion extends StatefulWidget
{
  @override
  _seleccionState createState()=>   _seleccionState();

}

class _seleccionState extends State<seleccion>
{
  final cantidades_controller= TextEditingController();
  int select=0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var v1=[Image.asset("assets/uno.jpg"),Image.asset("assets/dos.jpg"),Image.asset("assets/tres.jpg"),Image.asset("assets/uno.jpg"),Image.asset("assets/dos.jpg"),Image.asset("assets/tres.jpg")];
    var v2=["Producto 1","Producto 2","Producto 3","Producto 1","Producto 2","Producto 3"];
    var v3=["Descripcion del producto 1","Descripcion del producto 2sdfgasdfgasdfgasdga sadgfasdf asdfsd af asdf","Descripcion del producto 3","Descripcion del producto 1","Descripcion del producto 2","Descripcion del producto 3"];
    var v4=["12","23","231","123","12","0"];
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(backgroundColor: materialcolor1(),iconTheme: IconThemeData(color: materialcolor2()),title: Text("SELECCION DE PRODUCTOS",style: TextStyle(color: materialcolor2()),),),
        body: Container(
        child: ListView.separated(
          separatorBuilder: (context,index)=> Divider(color: materialcolor2(),),
        itemBuilder: (context,index)
          {
                   return  MaterialButton(
                        padding: EdgeInsets.all(0),
                  onPressed: ()
                        {

                            cantidades_controller.clear();

                            return showDialog(

                              context: context,
                              builder: (BuildContext context)
                              {
                                return AlertDialog(
                                  backgroundColor: materialcolor2(),
                                  title: Text(v2[index],style: TextStyle(color: materialcolor1()),),
                                  content:

                                  Container(
                                    height: 400,
                                  width: width*0.65,

                                  child: ListView(
                                    children: <Widget>[
                                          Container(
                                            width: width*0.6,
                                            height: 200,
                                            child: v1[index],
                                          ),
                                          Text("")
                                          ,
                                          Container(
                                            child: Text(v3[index],style: TextStyle(color: materialcolor1()),),
                                            height: 50,
                                          ),
                                          Text("")
                                          ,
                                          Container(
                                            child: Text("Disponible: "+v4[index],style: TextStyle(color: materialcolor1()),),
                                          ),
                                          Text("")
                                          ,
                                          Row(
                                              children: <Widget>[
                                                Text("Cant.    ",style: TextStyle(color: materialcolor1()),),

                                                Container(
                                                    width: 30,
                                                    height: 20,
                                                    color: materialcolor1(),
                                                    padding: EdgeInsets.only(top: 1),
                                                    child: TextFormField(
                                                      cursorColor: materialcolor2(),
                                                      controller: cantidades_controller,
                                                      validator: (value)
                                                      {
                                                        if(value.isEmpty)
                                                          return "Ingrese un valor de Cantidad mayor a uno";
                                                      },
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                                                        ,focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0)),
                                                        hintText: "0",

                                                      ),

                                                        )
                                                ),
                                                VerticalDivider(),
                                                MaterialButton(
                                                  minWidth: width*0.3,
                                                  child: Text("Agregar",style: TextStyle(color: materialcolor2()),),
                                                  color: materialcolor1(),
                                                  onPressed: ()
                                                  {
                                                    Navigator.pop(context);



                                                  },
                                                )])




                                    ],
                                  )
                                ));
                              }
                            );
                        },


                  minWidth: width*0.95,
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(width*0.05),
                    width: width*0.3,
                    color: materialcolor2(),
                    child: v1[index]),
                    Container(
                      width: width*0.7,
                    padding: EdgeInsets.all(0),
                    child:Column(
                      
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 10,top: 10,left:20),
                      child: Text(v2[index],textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),
                      height: 20,
                      width: width),
                      Text(""),
                      Container(

                          padding: EdgeInsets.only(bottom: 10,left: 20),
                      child: Text(v3[index]),
                      height: 18,
                          width: width),
                      Text(""),
                      Container(

                          padding: EdgeInsets.only(bottom: 10,left: 20),
                          child: Text("Disponible: "+v4[index]),
                          color: Colors.white,
                          height: 20,
                          width: width)
                      ],
                    )),

                  ],
                )
              );

          },
      itemCount: v1.length,
    )

    ),
    );
  }

}
