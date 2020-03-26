import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;



void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  var _connectivityStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = new Connectivity();
    subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectivityStatus = result.toString();
      print(_connectivityStatus);

      if(result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)
        {
          setState(() {

          });
        }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  Future getData() async
  {
    http.Response response = await http.get("https://jsonplaceholder.typicode.com/posts/");

        if(response.statusCode == HttpStatus.ok)
          {
            var result = jsonDecode(response.body);
            return result;
          }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Internet Connectivity"),
      ),
      body: new FutureBuilder(
          future: getData(),
          builder: (context,snapshot) {
            if(snapshot.hasData)
              {
                var mydata = snapshot.data;
                return new ListView.builder(
                    itemBuilder: (context, i) => new ListTile(
                      title: Text(mydata[i]['title']),
                    ), itemCount: mydata.length,);

              }
            else
              {
                return Center(
                  child: new CircularProgressIndicator(),
                );
              }
          }),
    );
  }
}

