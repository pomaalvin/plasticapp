import 'package:plasticapp/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String nombre_cliente;
class seleccion extends StatefulWidget
{
  @override
  _seleccionState createState()=>   _seleccionState(userName);
  final String userName;
  seleccion(this.userName);

}

class _seleccionState extends State<seleccion>
{
  dynamic selectedLuckyNumber;
  List luckyNumbersList = [];
  final GlobalKey _menuKey = new GlobalKey();
  String email;
  @override
  _seleccionState(String email)
  {
    this.email=email;
  }
  String nombre="";

  final cantidades_controller= TextEditingController();
  final my_key=GlobalKey<FormState>();

  var _currentItemSelected ="";
  int select=0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: Firestore.instance.collection("productos").snapshots(),
      builder: (context,snapshot)
      {
        if(snapshot.hasData)
          {


            return StreamBuilder(
              stream: Firestore.instance.collection("clientes").snapshots(),
              builder: (context,snapshot1)
              {
                if(snapshot1.hasData)
                {luckyNumbersList.clear();
                for(int i=0;i<snapshot1.data.documents.length;i++)
                {
                  luckyNumbersList.add(snapshot1.data.documents[i]["Nombre"]);
                  print("11");

                }
                    nombre_cliente=snapshot1.data.documents[0]["Nombre"];
                  return Scaffold(
                    drawer: drawer(context,email),
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
                                            title: Text(snapshot.data.documents[index]["Nombre"],style: TextStyle(color: materialcolor1()),),
                                            content:
                                            Form(
                                              key:my_key,
                                              child: Container(
                                                  height: 500,
                                                  width: width*0.65,

                                                  child: ListView(
                                                    children: <Widget>[
                                                      Container(
                                                        width: width*0.6,
                                                        height: 200,
                                                        child: Image.network(snapshot.data.documents[index]["imagen"]),
                                                      ),
                                                      Text("")
                                                      ,
                                                      Container(
                                                        child: Text(snapshot.data.documents[index]["Descripcion"],style: TextStyle(color: materialcolor1()),),
                                                        height: 50,
                                                      ),
                                                      Text("")
                                                      ,
                                                      Container(
                                                        color: materialcolor1(),
                                                        child: Text("Disponible: "+snapshot.data.documents[index]["Cantidad"].toString(),style: TextStyle(color: materialcolor2()),),
                                                      ),
                                                      Text("")
                                                      ,
                                                      Row(
                                                          children: <Widget>[
                                                            Text("Cant.    ",style: TextStyle(color: materialcolor1()),),

                                                            Container(
                                                                width: width*0.3,
                                                                height: 40,
                                                                color: materialcolor1(),
                                                                padding: EdgeInsets.only(top: 1),
                                                                child: Material(
                                                                  color: materialcolor1(),

                                                                  elevation: 10,
                                                                  child: TextFormField(
                                                                    cursorColor: materialcolor2(),
                                                                    controller: cantidades_controller,
                                                                    validator: (value)
                                                                    {
                                                                      if(value.isEmpty)
                                                                        return "Mayor a 0";
                                                                    },
                                                                    decoration: InputDecoration(

                                                                      contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 5)
                                                                      ,focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0)),
                                                                      hintText: "0",

                                                                    ),

                                                                  ),
                                                                )
                                                            ),
                                                          ]),
                                                      Divider(),
                                                      DynamicDialog(selected: snapshot1.data.documents[0]["Nombre"],lucky: luckyNumbersList,menu: _menuKey,),

                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                          MaterialButton(
                                                            minWidth: width*0.3,
                                                            child: Text("Agregar",style: TextStyle(color: materialcolor2()),),
                                                            color: materialcolor1(),
                                                            onPressed: ()
                                                            {
                                                              print(nombre_cliente);
                                                              if(my_key.currentState.validate())
                                                              {
                                                                if(int.parse(snapshot.data.documents[index]["Cantidad"].toString())>=int.parse(cantidades_controller.text)){
                                                                  Firestore.instance.collection("ventas2").add({
                                                                    'Nombre': snapshot.data.documents[index]["Nombre"],
                                                                    'Cantidad': int.parse(cantidades_controller.text),
                                                                    'Precio':snapshot.data.documents[index]["Precio"],
                                                                    'Cliente':nombre_cliente,
                                                                    'Total':int.parse(snapshot.data.documents[index]["Precio"])*int.parse(cantidades_controller.text)});
                                                                  Firestore.instance.collection("productos").document(snapshot.data.documents[index].documentID).setData({
                                                                    'Nombre': snapshot.data.documents[index]["Nombre"],
                                                                    'Empresa': snapshot.data.documents[index]["Empresa"],
                                                                    'Descripcion': snapshot.data.documents[index]["Descripcion"],
                                                                    'Cantidad': (int.parse(snapshot.data.documents[index]["Cantidad"].toString())-int.parse(cantidades_controller.text)),
                                                                    'imagen':snapshot.data.documents[index]["imagen"].toString(),
                                                                    'Precio':snapshot.data.documents[index]["Precio"]});
                                                                  Navigator.pop(context);}
                                                                else{
                                                                  return showDialog(
                                                                      context: context,
                                                                      builder: (BuildContext context)
                                                                      {
                                                                        return AlertDialog(
                                                                          title: Text("ERROR"),
                                                                          content: Text("La Cantidad supera la del inventario"),
                                                                        );
                                                                      }
                                                                  );

                                                                }
                                                              }
                                                              else
                                                                {
                                                                  print("EROROOROROROR");
                                                                }


                                                            },
                                                          ), VerticalDivider(),
                                                          MaterialButton(
                                                            minWidth: width*0.3,
                                                            child: Text("Cancelar",style: TextStyle(color: materialcolor2()),),
                                                            color: materialcolor1(),
                                                            onPressed: ()
                                                            {
                                                              Navigator.pop(context);
                                                            },
                                                          )
                                                        ],
                                                      )




                                                    ],
                                                  )
                                              ),
                                            )

                                        );
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
                                        color:  materialcolor2(),
                                        child: Image.network(snapshot.data.documents[index]["imagen"])),
                                    Container(
                                        width: width*0.7,
                                        padding: EdgeInsets.all(0),
                                        child:Column(

                                          children: <Widget>[
                                            Container(
                                                color:materialcolor2(),
                                                padding: EdgeInsets.only(bottom: 0,top: 5,left:20),
                                                child: Text(snapshot.data.documents[index]["Nombre"],textAlign: TextAlign.left,style: TextStyle(fontSize: 20,color: materialcolor1()),),
                                                height: 38,
                                                width: width),
                                            Container(
                                                color: Colors.white,

                                                padding: EdgeInsets.only(bottom: 0,left: 20),
                                                child: Text(snapshot.data.documents[index]["Descripcion"],style: TextStyle(color: materialcolor2()),),
                                                height: 50,
                                                width: width),
                                            Container(

                                                padding: EdgeInsets.only(bottom: 2,left: 20),
                                                child: Row(
                                                  children: <Widget>[Text("Disponible: "+snapshot.data.documents[index]["Cantidad"].toString(),style: TextStyle(color: materialcolor2()),),
                                                  VerticalDivider(width: width*0.2,),
                                                  Text(snapshot.data.documents[index]["Precio"]+"Bs.",style: TextStyle(color: materialcolor2(),),)],
                                                ),
                                                color:  materialcolor1(),
                                                height: 20,
                                                width: width)
                                          ],
                                        )),

                                  ],
                                )
                            );

                          },
                          itemCount: snapshot.data.documents.length,
                        )

                    ),
                  );

                }
                else
                {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  );
                }
              },
            );
          }
        else
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              )
            ],
          );
        }
      }
      ,
    );
  }

}
class DynamicDialog extends StatefulWidget {
  DynamicDialog({this.selected,this.lucky,this.menu});

 dynamic selected;
 List lucky;
 GlobalKey menu;

  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {

  @override
  void initState() {
    selectedLuckyNumber = widget.selected;
    luckyNumbersList= widget.lucky;
    _menuKey= widget.menu;
    super.initState();
  }
  dynamic selectedLuckyNumber;
  List luckyNumbersList = [];
  GlobalKey _menuKey = new GlobalKey();
  Widget _buildListTile(){

    List<PopupMenuItem> luckyNumbers = [];
    for (String luckyNumber in luckyNumbersList) {
      luckyNumbers.add(
          new PopupMenuItem(
height: 50,
            
            child: Text("$luckyNumber",style: TextStyle(color: materialcolor2() ),),

            value: luckyNumber,
          )
      );
    }
    void handlePopUpChanged(String value) {
      setState(() {
        selectedLuckyNumber =  value;
        nombre_cliente=value;
      });
    }

    return new Theme(
        data: Theme.of(context).copyWith(cardColor: materialcolor1(),),
      child: ListTile(
contentPadding: EdgeInsets.all(0),

        title: new Text(selectedLuckyNumber.toString(),style: TextStyle(color: materialcolor1()),),
        trailing: new Container(
            color: materialcolor1(),
            child:new PopupMenuButton(

              key: _menuKey,
              onSelected: (selectedDropDownItem) => handlePopUpChanged(selectedDropDownItem),
              itemBuilder: (BuildContext context) => luckyNumbers,
              tooltip: "Tap me to select a number.",
            )
        ),

        /// When ListTile is tapped, open the popUpMenuButton! Notice how we use
        /// menuKey to do that.
        onTap: () {
          dynamic popUpMenustate = _menuKey.currentState;
          popUpMenustate.showButtonMenu();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildListTile();
  }
}