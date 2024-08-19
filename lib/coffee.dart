// ignore_for_file: unused_element

class Coffee {
  String name;
  String price;
  String image;
  String description;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
  String get _name => name;
  String get _price => price;
  String get _image => image;
  String get _description => description;
}