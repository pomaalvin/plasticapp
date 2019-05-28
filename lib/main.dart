import 'package:flutter/material.dart';
import './paginas/menu.dart';
import './paginas/login.dart';
import './paginas/seleccion.dart';
import './paginas/nuevos.dart';
import './paginas/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './paginas/historial.dart';
import './paginas/clientes.dart';
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
    "/login": (BuildContext context)=>inicio(),
    "/usuario":(BuildContext context)=>usuario(),

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
drawer(BuildContext context,String email)
{
  Drawer d= new Drawer(


    child: StreamBuilder(
      stream: Firestore.instance.collection("usuarios").where("Email",isEqualTo: email).snapshots(),
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
            {
              return Container(
                  color: materialcolor2(),
                  child: ListView(

                    children: <Widget>[
                      UserAccountsDrawerHeader(


                        accountEmail: Text(snapshot.data.documents[0]["Email"],style: TextStyle(color:materialcolor2())),
                        accountName: Text(snapshot.data.documents[0]["Nombre"],style: TextStyle(color:materialcolor2())),
                        currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(snapshot.data.documents[0]["imagen"]),),
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
                          Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new seleccion(email) ));
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
                          Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new clientes(email) ));
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
                          Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new historial(email) ));
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
                          Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new nuevos(email) ));
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
                          Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new inicio()) );
                        },
                      ),
                    ],

                  )
              );
            }
            else
              {
                return Container(
                    color: materialcolor2(),
                    child: ListView(

                      children: <Widget>[
                        UserAccountsDrawerHeader(


                          accountEmail: Text("Cargando...",style: TextStyle(color:materialcolor2())),
                          accountName: Text("Cargando",style: TextStyle(color:materialcolor2())),
                          currentAccountPicture: CircleAvatar(backgroundImage:AssetImage("assets/default_image.jpg"),),
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
                            Navigator.push(context,new MaterialPageRoute(builder: (BuildContext context)=>new inicio()) );
                          },
                        ),
                      ],

                    )
                ); 
              }
          
        }
    )

  );
  return d;
}