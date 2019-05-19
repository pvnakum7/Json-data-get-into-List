import 'package:flutter/material.dart';
import 'package:dispaly_image_from_network/MyPhoto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


    void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFetchData(),
    ));

  class MainFetchData extends StatefulWidget {
    @override
    _MainFetchDataState createState() => _MainFetchDataState();
  }

    class _MainFetchDataState extends State<MainFetchData> {

    var isLoading = false;

    List<MyPhoto> list = List();

    _fetchdata() async{
        setState(() {
          return true;

        });

      final response =  await   http.get("https://jsonplaceholder.typicode.com/photos");
        list = (json.decode(response.body) as List).
        map((data) => new MyPhoto.fromJson(data)).toList();

      if(response.statusCode == 200){
        print('Print Code: ');
        print(response.statusCode);

        isLoading = false;
      }
//      type= 1


//      Part 2
//    Map map = json.decode(response.body) ;
//    list = MyPhoto.fromJson(map) as List;

    }

      @override
      Widget build(BuildContext context) {

      var isLoading = false;

        return Scaffold(
            appBar: AppBar(title: Text('Json data parsing'),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: new Text("Fetch Data"),
                onPressed:  _fetchdata,
              ),
            ),
            body: isLoading ? Center(
              child: CircularProgressIndicator(),
            )
                : list != null ? ListView.builder(itemCount: list.length,
                itemBuilder:  (BuildContext context, int index)
            {
              return ListTile(
                title: new Text(list[index].title),
                trailing: new Image.network(
                  list[index].thumbnailUrl,
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 100.0,

                ),

              );

            })
            :Container()
        );
      }


    }






















/*
class Photo {
  final String title;
  final String thumbnailUrl;
  Photo._({this.title, this.thumbnailUrl});
  factory Photo.fromJson(Map<String, dynamic> json) {
    return new Photo._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}*/
