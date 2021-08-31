import 'package:flutter/material.dart';
 
//void main() => runApp(MyApp());

main() {
  runApp(MaterialApp(home: MyApp()));
}
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool female = true;
bool male = false;
var _controller = TextEditingController();
var controller = TextEditingController();

double imc = double.parse(controller.text) / (double.parse(_controller.text) * double.parse(_controller.text));

calculateIMC(BuildContext ctx) {
  if(female == true) {
    showDialog(
      context: ctx,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text("Tu IMC: ${imc.toStringAsFixed(2)}")),
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: 
                  Text("Tabla de IMC para mujeres:", textAlign: TextAlign.left)    
              ),
              Text("Edad  -  IMC ideal", textAlign: TextAlign.center),
              Text("16 - 24 / 19 - 24", textAlign: TextAlign.center),
              Text("25 - 34 / 20 - 25", textAlign: TextAlign.center),
              Text("35 - 44 / 21 - 26", textAlign: TextAlign.center),
              Text("45 - 54 / 22 - 27", textAlign: TextAlign.center),
              Text("55 - 64 / 23 - 28", textAlign: TextAlign.center),
              Text("65 - 90 / 25 - 30", textAlign: TextAlign.center),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, 
                child: Text('Aceptar', textAlign: TextAlign.right),
              )
            ],
          );
        });
  } else {
    showDialog(
      context: ctx,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text("Tu IMC: ${imc.toStringAsFixed(2)}")),
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: 
                  Text("Tabla de IMC para hombres:", textAlign: TextAlign.left)    
              ),
              Text("Edad  -  IMC ideal", textAlign: TextAlign.center),
              Text("16 - 24 / 23 - 27", textAlign: TextAlign.center),
              Text("25 - 34 / 24 - 28", textAlign: TextAlign.center),
              Text("35 - 44 / 24 - 32", textAlign: TextAlign.center),
              Text("45 - 54 / 24 - 32", textAlign: TextAlign.center),
              Text("55 - 64 / 24 - 34", textAlign: TextAlign.center),
              Text("65 - 90 / 24 - 35", textAlign: TextAlign.center),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, 
                child: Text('Aceptar', textAlign: TextAlign.right),
              )
            ],
          );
        });
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.green
      ),
      home: Scaffold(
        
        appBar: AppBar(
          title: Text('Calcular IMC'),
          actions: <Widget> [
            IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              _controller.clear();
              controller.clear();
            },
          ),
          ]
        ),
          
        body: ListView(
        children: [

          Container(
            padding: EdgeInsets.all(12),
            child: Text("Ingrese sus datos para calcular el IMC", textAlign: TextAlign.center),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.female,
                      color: female ? Colors.blue : Colors.black,
                    ),
                    iconSize: 50,
                    onPressed: () {
                      female = !female;
                      male = !male;
                      setState(() {});
                    }  
                  ),
                  Text('Mujer', style: TextStyle(fontWeight: FontWeight.bold, color: female ? Colors.blue : Colors.black))
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.male,
                      color: male ? Colors.blue : Colors.black,
                    ),
                    iconSize: 50,
                    onPressed: () {
                      female = !female;
                      male = !male;
                      setState(() {});
                    }  
                  ),
                  Text('Hombre', style: TextStyle(fontWeight: FontWeight.bold, color: male ? Colors.blue : Colors.black))
                ],
              ),

            ],
          ),
          
          SizedBox(height: 14),
          
          ListTile(
            leading: Icon(Icons.square_foot),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ingresar altura (Metros)",
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ), 
          
          ListTile(
            leading: Icon(Icons.line_weight),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ingresar peso (kg)",
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ), 

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: MaterialButton(
                    child: Text("Calcular"),
                    onPressed: (){
                      //print(_controller.text);
                      //print(controller.text);
                      calculateIMC(context);
                      //setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}