


class Photo {
  final String title;
  final String thumbnailUrl;
  Photo._(
      {this.title, this.thumbnailUrl}
      );
  factory Photo.fromJson(Map<String, dynamic> json) {
    return new Photo._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}




















/*

//json string array to json string

class jstringdata {
  final String cname;
  final List<dynamic> jlist;

  jstringdata(this.cname, this.jlist);

  jstringdata.fromJson(Map<String, dynamic> json)
      : cname = json['cname'],
        jlist = json['jlist'];

  Map<String, dynamic> toJson() =>
      {
        'cname': cname,
        'jlist': jlist,
      };

//      .fromJson(Map<String, dynamic> tojson){
    
    
}



*/







