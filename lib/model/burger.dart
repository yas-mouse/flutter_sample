class Burger {
  String id;
  String title;
  String description;
  String imageName;
  int price;

  Burger(
      {this.id, this.title, this.description, this.imageName, this.price});

  factory Burger.fromJson(Map<String, dynamic> parsedJson) {
    return Burger(
      id: parsedJson['_id'],
      title: parsedJson['title'],
      description: parsedJson['description'],
      imageName: parsedJson['imageName'],
      price: parsedJson['price'],
    );
  }
}
