import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui_page/mainpage.dart';
import 'package:flutter_assignment/ui_page/register.dart';

class MyCustomFormLogin extends StatefulWidget {
  @override
  MyCustomFormState_Login createState() {
    return MyCustomFormState_Login();
  }
}

class MyCustomFormState_Login extends State<MyCustomFormLogin> {
  final _formkey = GlobalKey<FormState>();
  String username;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: new Container(
            decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [Colors.pink[200], Colors.pink[200]],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
              ),
            ),
            child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    "resources/logo.png", 
                    width: 150,
                    height: 150,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "User Id",
                      hintText: "กรุณา ระบุ user id",
                      icon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      username = value;
                      if(value.isEmpty) {
                        return 'กรุณา ระบุ user';
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
                      if(value.isEmpty) {
                        return 'กรุณา ระบุ password';
                      }
                    },
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('LOGIN'),
                        color: Colors.pinkAccent[200],
                        textColor: Colors.white,
                        onPressed: () {   
                          _formkey.currentState.validate();
                          if (username == "admin" && password == "admin") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                          }
                          else if (username.isEmpty || password.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ข้อความแจ้งเตือน"),
                                  content: new Text("กรุณา ระบุ user id or password"),
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
                          else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ข้อความแจ้งเตือน"),
                                  content: new Text("user or password ไม่ถูกต้อง"),
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
                      ),
                    ] 
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: new Text(
                          "Register New Account",
                          style: new TextStyle(
                            color: Colors.pink,
                            fontSize: 10.0,
                            letterSpacing: 0.1,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomFormRegister()));
                        },
                      )   
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
    
  }
}
