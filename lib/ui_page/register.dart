import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui_page/login.dart';

class MyCustomFormRegister extends StatefulWidget {
  @override
  MyCustomFormState_Register createState() {
    return MyCustomFormState_Register();
  }
}

class MyCustomFormState_Register extends State<MyCustomFormRegister> {
  final _formkey = GlobalKey<FormState>();
  String username;
  String password;
  String password_2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("REGISTER")
        ), 
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User Id",
                hintText: "กรุณา ระบุ user id",
                icon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                username = value;
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
                else if (value == "admin") {
                  return 'user นี้มีอยู่ในระบบแล้ว';
                }
              },
            ),
            
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "กรุณา ระบุ password",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
                password = value;
                if (value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Repeat Password",
                hintText: "กรุณา ระบุ password อีกครั้ง",
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              onSaved: (value) => print(value),
              validator: (value) {
                password_2 = value;
                if(value.isEmpty) {
                  return 'กรุณาระบุข้อมูลให้ครบถ้วน';
                }
              },
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme( 
                      child: RaisedButton(
                        child: Text('Continue'),
                        textColor: Colors.white,
                        onPressed: () {
                          _formkey.currentState.validate();
                          if (username != "admin" && (username != "" && password != "" && password_2 != "")) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomFormLogin()));
                          }
                          else if (username.isEmpty || password.isEmpty || password_2.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ข้อความแจ้งเตือน"),
                                  content: new Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("ปิด"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else if (username == 'admin') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ข้อความแจ้งเตือน"),
                                  content: new Text("user นี้มีอยู่ในระบบแล้ว"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text("ปิด"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      )
                    ),
                  ],
                )   
              ],
            )
          ],
        ),
      ),
    );
  }
}
