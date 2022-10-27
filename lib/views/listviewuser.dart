import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class ListUsers extends StatefulWidget {
  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List data;

  Future<List> getData() async {
    final response = await http.get("http://localhost:8787/users");
    return json.decode(response.body);
  }

  _navigateAddUser(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUserPage()),
    );

    if(result){
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Usuarios'),
        actions: [
          RaisedButton(
            color: Colors.black12,
            child: Icon(Icons.add),
            onPressed: () => _navigateAddUser(context),
          )
        ],
      ),
      body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(
                    list: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  const ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: ((context, index){
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  height: 100.3,
                  child: Card(
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[index]['correo'].toString(),
                                  style: TextStyle(
                                    fontSize: 20.0, 
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  list[index]['tipo_deporte'].toString(),
                                  style: TextStyle(
                                    fontSize: 20.0, 
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
