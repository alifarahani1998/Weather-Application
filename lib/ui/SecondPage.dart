import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:klimatic/ui/MainPage.dart';


class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondPage1();


}



class SecondPage1 extends State<SecondPage> {


  void debug(String string) {
    debugPrint(string);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              "Klimatic"
          ),
        ),

        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            Image.asset("assets/images/city.jpg", fit: BoxFit.fill, height: 6000, width: 4000,),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar<String>(
//                crossAxisCount: 3,
//                indexedScaledTileBuilder: (int index) => ScaledTile.count(
//                  index % 3 == 0 ? 2 : 1,
//                  1,
//                ),
                  minimumChars: 1,
                  onSearch: search,
                  onItemFound: (String city, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pop(
                          context,
                          city
                        );
                      },
                      title: Text(city),
                    );
                  },
                  searchBarStyle: SearchBarStyle(
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search for Location",
                  loader: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                      )
                  ),
                ),
              ),
            ),
          ],
        )

    );
  }

  @override
  void initState() {

    super.initState();

  }

}

//class Weather {
//
//  String title;
//  String description;
//
//  Weather(this.title, this.description);
//
//}



Future<List<String>> search(String typed) async {

  List<String> list = ["tehran", "qom", "qazvin", "tabriz", "karaj", "ahvaz", "isfahan", "shiraz", "abadan", "zahedan", "kerman", "zanjan", "zabol", "gilan"];
  List<String> match = new List<String>();

  await Future.delayed(Duration(seconds: 1));
//  if (typed == "empty") return [];
//  else if (typed == "error") throw Error();
//  else if (typed == "karim") return List.generate(10, (int index){return Weather("fs", "fsd",);});
//  else return List.generate(typed.length, (int index) {
//    return Weather(
//      "Title: $typed $index",
//      "Description: $typed $index",
//    );
//  });

//  for (var i = 0; i < typed.length; i++) {
//    if (list.contains(typed)) {
//      print("contains");
//      return List.generate(typed.length, (int index) {
//        return Weather(
//          "title",
//          "subtitle"
//        );
//      });
//    }
//    else {
//      print("not containing");
//      return [];
//    }
//  }


  for (var i = 0; i < list.length; i++) {
    if (list[i].contains(typed)) {
      print("contains");
      match.add(list[i]);
    }
  }

  return match;
}


