import 'dart:html';

import 'package:flutter/material.dart';
import '../controllers/databasehelpers.dart';

class AddUserPage extends StatefulWidget {
  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  DataBaseHelper databasehelper = DataBaseHelper();

  final TextEditingController correoController = TextEditingController();
  final TextEditingController tipoDeporteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: const EdgeInsets.only(
              top: 62, left: 12.0, right: 12.0, bottom: 12.0),
          children: [
            Container(
              height: 50,
              child: TextField(
                controller: correoController,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Correo usuario',
                  icon: new Icon(Icons.person),
                ),
              ),
            ),
            Container(
              height: 50,
              child: TextField(
                controller: tipoDeporteController,
                decoration: InputDecoration(
                  labelText: 'tipo_deporte',
                  hintText: 'Deporte preferido',
                  icon: new Icon(Icons.ball),
                ),
              ),
            ),
            Padding(
                                padding: new EdgeInsets.only(top: 44.0),
                              ),
                              Container(
                                height: 50,
                                child: RaisedButton(
                                  onPressed: (){
                                    databasehelper.addUser(
                                      correoController.text.trim(),
                                      tipoDeporteController.text.trim(),
                                      Navigator.pop(context, true);
                                    ),
                                    color: Colors.blue,
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                        color: Colors.white, background: Colors.blue
                                      ),
                                    ),
                                  },
                                ),
                              ),
          ],
        ),
      ),
    );
  }
}
