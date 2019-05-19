// To parse this JSON data, do
//
//     final myPhoto = myPhotoFromJson(jsonString);

import 'dart:convert';

List<MyPhoto> myPhotoFromJson(String str) => new List<MyPhoto>.from(json.decode(str).map((x) => MyPhoto.fromJson(x)));

String myPhotoToJson(List<MyPhoto> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class MyPhoto {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  MyPhoto({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory MyPhoto.fromJson(Map<String, dynamic> json) => new MyPhoto(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
