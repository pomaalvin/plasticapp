import 'package:flutter/material.dart';
import './paginas/menu.dart';
import './paginas/login.dart';
import './paginas/seleccion.dart';
import './paginas/nuevos.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PLASTICAPP",
      home: inicio(),
      routes: {
    "/menu": (BuildContext context)=>menu(),
    "/login": (BuildContext context)=>inicio(),
    "/seleccion":(BuildContext context)=>seleccion(),
    "/nuevos":(BuildContext context)=>nuevos(),
      },
    );
  }

}
materialcolor1()
{
  Color color=new Color(0xffffa700);
  return color;
}
materialcolor2()
{
  Color color=new Color(0xff292a2c);
  return color;
}
materialcolor3()
{
  Color color=new Color(0xff292a2c);
  return color.withOpacity(0.8);
}

drawer()
{
  Drawer d= new Drawer(


    child: Container(
      color: materialcolor2(),
    child: ListView(

     children: <Widget>[
       UserAccountsDrawerHeader(


       accountEmail: Text("pomaalvin@gmail.com",style: TextStyle(color:materialcolor2())),
         accountName: Text("Poma Tarqui Alvin Jamil",style: TextStyle(color:materialcolor2())),
         currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/perfil.jpg"),),
          decoration: BoxDecoration(boxShadow: [new BoxShadow(color: materialcolor1())],),
         margin: EdgeInsets.only(top:0),
       ),
       MaterialButton(
         height: 70,
         color: materialcolor2(),
         child: Row(
           children: <Widget>[
             new Icon(Icons.add_shopping_cart,color: materialcolor1(),size:30),
             Text("     SELECCION DE PRODUCTOS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor1()))
           ],
         ),
         onPressed: ()
         {

         },
       ),
       MaterialButton(
         height: 70,
         color: materialcolor2(),
         child: Row(
           children: <Widget>[
             new Icon(Icons.group_add,color: materialcolor1(),size:30),
             Text("     NUEVOS CLIENTES",textAlign: TextAlign.center,style: TextStyle(color:materialcolor1()))
           ],
         ),
         onPressed: ()
         {

         },
       ),
       MaterialButton(
         height: 70,
         color: materialcolor2(),
         child: Row(
           children: <Widget>[
             new Icon(Icons.history,color: materialcolor1(),size:30),
             Text("     HISTORIAL DE VENTAS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor1()))
           ],
         ),
         onPressed: ()
         {

         },
       ),
       MaterialButton(
         height: 70,
         color: materialcolor2(),
         child: Row(
           children: <Widget>[
             new Icon(Icons.library_add,color: materialcolor1(),size:30),
             Text("     NUEVOS PRODUCTOS",textAlign: TextAlign.center,style: TextStyle(color:materialcolor1()))
           ],
         ),
         onPressed: ()
         {

         },
       ),
       MaterialButton(
         height: 70,
         color: materialcolor2(),
         child: Row(
           children: <Widget>[
             new Icon(Icons.close,color: materialcolor1(),size:30),
             Text("     LOGOUT",textAlign: TextAlign.center,style: TextStyle(color:materialcolor1()))
           ],
         ),
         onPressed: ()
         {

         },
       ),
     ],

    )
  ),

  );
      return d;
}