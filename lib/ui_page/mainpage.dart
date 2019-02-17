import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("HOME")
            ), 
          ),
          body: Center(
            child: TabBarView(
              children: <Widget>[
                Container(
                  child: Row(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[ 
                      new Text(
                        'Home',
                        style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        letterSpacing: 0.1,
                        )
                      )
                    ]
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Notify',
                        style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        letterSpacing: 0.1,
                        )),  
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Map',
                        style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        letterSpacing: 0.1,
                        )),  
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Profile',
                        style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        letterSpacing: 0.1,
                        )),  
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text('Setup',
                        style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 25.0,
                        letterSpacing: 0.1,
                        )),  
                    ],
                  ),
                ),
              ],
            )   
          ),
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.location_on)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ],   
            labelColor: Colors.pink,
            indicatorColor: Colors.pink,
          ),   
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

