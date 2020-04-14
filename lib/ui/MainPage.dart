import 'package:flutter/material.dart';
import 'package:klimatic/ui/SecondPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class MainPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return MainPage1();
  }

}





class MainPage1 extends State<MainPage> {


  static String result = "";
  Map list = new Map();
  String url = "";
  String temp;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Klimatic",
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: <Widget>[
          Image.asset("assets/images/weather.jpg", fit: BoxFit.fill, height: 6000, width: 4000,),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 20, left: 20),
            height: 200,
            width: 200,
            child: ListView(
              children: <Widget>[
                Text(
                  "Current Weather\n",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                  ),
                ),
                Text(
                  "\t${temp == null ? "" : temp}",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "${list.isEmpty ? "" : "${list['weather'][0]['main']}"}",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            )
          ),
          Container(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 15, right: 5),
              child: RawMaterialButton(
                onPressed: showResult,
                child: new Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25.0,
                ),
                shape: new CircleBorder(),
                fillColor: Colors.redAccent,
                padding: const EdgeInsets.all(15.0),
              ),
            )
          ),
        ],
      ),
    );
  }


  void getList() async {
    list = await getJSON();
    setState(() {
      calculate(list['main']['temp'].toString());
      print(list);
    });
  }


  void calculate(String string) {
    double t = double.parse(string);
    t = t - 273.15;
    temp = t.toStringAsFixed(2);
  }


  Future<Map> getJSON() async {
    http.Response response = await http.get(url);
    return json.decode(response.body);


  }


  Future showResult() async {
    result = await Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new SecondPage())
    );
    url = "http://api.openweathermap.org/data/2.5/weather?q=$result&appid=bfcc1b313aeca3460c986126bf796091";
    debugPrint(url);
    getList();
  }


}