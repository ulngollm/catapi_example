class Cat {
  final String url;
  Cat(this.url);

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(json['url']);
  
  static List<Cat> listFromJson(List<dynamic> json){
    return json.map<Cat>((value)=>Cat.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson(){
    return {
      "url": url
    };
  }
}
