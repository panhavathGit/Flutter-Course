class User {
  String firstName;
  String lastName;

  User({required this.firstName, required this.lastName});

  @override
  String toString() {
    return 'Name: ${firstName} ${lastName}';
  }
}