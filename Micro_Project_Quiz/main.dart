class User {
  String firstName;
  String lastName;

  User({required this.firstName, required this.lastName});

  @override
  String toString() {
    // TODO: implement toString
    return 'Name : ${firstName} ${lastName}';
  }
}

void main() {
  User user1 = User(firstName: "Vath", lastName: "Chan");
  print(user1.toString());
}
