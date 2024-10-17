class Address {
  String country;
  String city;
  String street;

  Address({required this.country, required this.city, required this.street});

  String toString() {
    return "Location : $country - $city - $street";
  }
}

class Tree {
  String name;
  double height;

  Tree(this.name, this.height);

  @override
  String toString() {
    return 'Name: ${this.name} - Height: ${this.height}';
  }
}

class Door {
  String color;
  double width;
  double height;
  String position;

  Door(this.color, this.width, this.height, this.position);

  @override
  String toString() {
    return 'Color: ${color} - Width: ${width} - Height: ${height} - Position: ${position}';
  }
}

class Window {
  String color;
  double width;
  double height;

  Window(this.color, this.width, this.height);

  @override
  String toString() {
    return 'Color: ${color} - Width: ${width} - Height: ${height}';
  }
}

class Roof {
  String material;
  String color;

  Roof({required this.material, required this.color});

  @override
  String toString() {
    return 'Material: ${material} - Color: ${color}';
  }
}
