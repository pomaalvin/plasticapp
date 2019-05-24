import 'package:flutter/material.dart';
import 'package:plasticapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
 class inicio extends StatefulWidget
 {
  @override
  _inicioState createState() =>_inicioState();
  }

  class _inicioState extends State<inicio>{
    Future<void> signIn() async {
      final formState = my_key.currentState;
      if(formState.validate()){
      formState.save();
      try{
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: usuario_editing.text , password: contra_editing.text);
      Navigator.pushNamed(context, "/menu");
      }
      catch(e){
      return showDialog(
          context: context,
        builder: (BuildContext context)
          {
            return AlertDialog(
              backgroundColor: materialcolor1(),
              content: Text("Usuario o Contraseña\nincorrectos"),
            );
          }
      );
      }
      }
    }
   final contra_editing= TextEditingController();
   final usuario_editing= TextEditingController();
   final my_key=GlobalKey<FormState>();
    @override
    String _email;
    String _password;
    Widget build(BuildContext context) {
    return  Scaffold(
      body:
      new Form(
        key: my_key,
        child: Container(
            padding: EdgeInsets.only(
            ),
            decoration: BoxDecoration( color: Colors.white,image: DecorationImage(image: AssetImage("assets/img103.png"),alignment: Alignment(0, -1),fit: BoxFit.fitWidth)),
            child:ListView(

              children: <Widget>[Column(
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/logo.png", width: 200,),
                    padding: EdgeInsets.only(top:100),),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 45),
                          child: new Row(
                              children: <Widget>[Text("Nombre de Usuario:",style: TextStyle(color: materialcolor2()),),]
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45,right: 45,top: 10),
                        child: Material(

                            elevation: 10,
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),topLeft: Radius.circular(30))),
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left:0),

                              child: TextFormField(
                                controller: usuario_editing,
                                decoration: InputDecoration(errorStyle: TextStyle(color: materialcolor1()),border: InputBorder.none,filled: false,contentPadding: EdgeInsets.only(top:10,bottom: 10,left: 50),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0,color: Colors.white))),
                                
                                validator: (value)
                                {
                                  if(value.isEmpty)
                                    return "Ingrese un nombre de usuario";
                                },
                              ),

                            )
                        ),),
                      Padding(
                          padding: EdgeInsets.only(left: 45,top: 10),
                          child: new Row(
                              children: <Widget>[Text("Contraseña:",style: TextStyle(color: materialcolor2()),),]
                          )
                      ),
                      Padding(

                        padding: EdgeInsets.only(left: 45,right: 45,top: 10),
                        child: Material(

                            elevation: 10,
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),topLeft: Radius.circular(30))),
                            color: Colors.white,
                            child: Padding(

                              padding: EdgeInsets.only(left: 0.0),

                              child: TextFormField(
                                decoration: InputDecoration(border: InputBorder.none,errorStyle: TextStyle(color: materialcolor2()),contentPadding: EdgeInsets.only(top:10,bottom: 10,left: 50)),
                                controller: contra_editing,
                                validator: (value)
                                {
                                  if(value.isEmpty)
                                    return "Ingrese una contraseña";
                                },
                              ),

                            )
                        ),),
                    ],
                  )
                  ,
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: RaisedButton(
                                child: Text("Registro",style: TextStyle(color: materialcolor1())),

                                onPressed: ()
                                {
                                  Navigator.pushNamed(context, "/registro");
                                },
                                color: materialcolor2(),
                              )),
                          RaisedButton(
                            child: Text("Login"),
                            onPressed: ()
                            {
                              signIn();
                            },
                            color: materialcolor1(),
                          ),]
                    ),),



                ],
              ),],

            )
        ),
      )
    );
  }

  }

  class registro extends StatelessWidget
  {
    @override
    Widget build(BuildContext context)
    {
      return new Scaffold(
      appBar: new AppBar(
        title: Text("hola mundo"),
      ),
      );

    }
  }
class login extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("login"),
      ),
    );

  }
}
