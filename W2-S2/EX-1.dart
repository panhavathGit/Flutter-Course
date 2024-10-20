enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;

  Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'Street: $street, City: $city, Zip Code: $zipCode';
  }
}

class Employee {
  String _name;
  double _baseSalary;
  Address _address;
  int _experience;

  List<Skill> _skills = [];

  Employee(this._name, this._baseSalary, this._address, this._experience);

  // Named constructor for mobile developers
  Employee.mobileDeveloper(
      {required String name,
      required double baseSalary,
      required int experience,
      required Address address})
      : _name = name,
        _baseSalary = baseSalary,
        _experience = experience,
        _address = address {
    _skills = [Skill.FLUTTER, Skill.DART];
  }

  // Getter method to access private fields
  String get name => this._name;
  double get baseSalary => this._baseSalary;
  Address get address => this._address;
  int get experience => this.experience;
  List<Skill> get skill => this._skills;

  //Calculate total salary method
  double totalSalary() => this._baseSalary + (this._experience * 2000);

  void printDetails() {
    print("Employee Details");
    print("================");
    print(
        'Employee: $_name, Base Salary: \$${_baseSalary}, Experience: ${_experience} years, Address: ${_address}\n');
  }

  void printSalary() {
    print("Salary specificaiton");
    print("====================");
    print("Base Salary : \$${this._baseSalary}");
    print("Each Year of Experience Salary : \$${this._experience * 2000}");
    print("Total Salary : \$${totalSalary()} \n");
  }
}

void main() {
  var address2 = Address(street: '456 St', city: 'Siem Reap', zipCode: 54321);

  var emp2 = Employee.mobileDeveloper(
      address: address2, baseSalary: 3000, name: "vath", experience: 3);

  emp2.printSalary();
  emp2.printDetails();
}
