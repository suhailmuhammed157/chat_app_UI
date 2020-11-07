import 'package:chat_app_machine_test/models/users.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<User>> getData() async {
    var data = await http.get('https://elephant-api.herokuapp.com/elephants');
    var jsonData = json.decode(data.body);
    for (var u in jsonData) {
      User user = User(name: u['name'], imageUrl: u['image']);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading..'),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (snapshot.data[index].isSelected) {
                      setState(() {
                        snapshot.data[index].isSelected =
                            !snapshot.data[index].isSelected;
                      });
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      snapshot.data[index].isSelected = true;
                    });
                  },
                  child: Container(
                    color: snapshot.data[index].isSelected
                        ? Colors.grey
                        : Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage(snapshot.data[index].imageUrl),
                      ),
                      title: Text(
                        snapshot.data[index].name,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
