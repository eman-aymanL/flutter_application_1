class MealModel {
  int? id;
  String imageUrl;
  String name;
  String description;
  double rate;
  String time;
  MealModel({
    this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.rate,
    required this.time,
  });
  factory MealModel.fromJson(Map<String, dynamic> json){
  
    
    return MealModel(
      id: json['id'],
      imageUrl: json['imageUrl'], 
      name: json['name'], 
      description: json['description'], 
      rate: json['rate'], 
      time: json['time']);
  }
  Map<String,dynamic>toJson(){ 
    return{
      'id':id,
      'imageUrl': imageUrl, 
      'name': name, 
      'description': description, 
      'rate': rate, 
      'time': time,
    };
  }
}
