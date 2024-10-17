import 'House_Component.dart';

class House {
  Address address;
  Roof roof;

  List<Tree> trees = [];
  List<Window> windows = [];
  List<Door> doors = [];

  House(this.address, this.trees, this.windows, this.doors,this.roof);

  void addTree(Tree tree) {
    this.trees.add(tree);
  }

  String toString() {
    return 'House Address : ${this.address}\n Tree : ${this.trees}\n\n Window : ${this.windows}\n\n Door : ${this.doors}\n\n ${this.roof}';
  }
}

void main() {
  //Roof
  Roof roof = Roof(color: "red", material: "tile");
  //Address
  Address address = Address(country: "Cambodia", city: "PP", street: "TK");
  // Create some trees
  Tree appleTree = Tree('Apple Tree', 2.2);
  Tree mangoTree = Tree('Mango Tree', 3.5);
  Tree orangeTree = Tree('Orange Tree', 1.2);

  // Create some windows
  Window window1 = Window('White', 1.5, 1.0);
  Window window2 = Window('Blue', 1.2, 1.5);

  // Create some doors
  Door door1 = Door('Brown', 0.8, 2.0, 'Front');
  Door door2 = Door('Red', 0.8, 2.0, 'Back');

  House h1 = House(address, [appleTree, mangoTree, orangeTree],
      [window1, window2], [door1, door2],roof);

  // Print the house details
  print(h1.toString());
}
