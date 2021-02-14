class Cat {
  final String url;
  final int height;
  final int width;
  Cat({this.url, this.height, this.width});

  factory Cat.fromJson(Map<String, dynamic> json) =>
      Cat(
        url: json['url'], 
        height: json['height'], 
        width: json['width']
      );

  static List<Cat> listFromJson(List<dynamic> json) {
    return json.map<Cat>((value) => Cat.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    return {"url": url, "height": height, "width":width};
  }
}
