enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final int zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

class Employee {
  final String _name;
  static final double _baseSalary = 40000;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  double get salary => computeSalary();

  Employee({
    required this._name,
    required this._skills,
    required this._address,
    required this._yearsOfExperience,
  });

  Employee.mobileDeveloper({
    required this._name,
    this._skills = const [Skill.DART, Skill.FLUTTER],
    required this._address,
    required this._yearsOfExperience,
  });

  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;

    for (final skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, Salary: ${salary}');
  }
}

void main() {
  var emp1 = Employee(
    name: 'Niza',
    skills: [Skill.DART, Skill.OTHER],
    address: Address(street: "123", city: "Phnom Penh", zipCode: 3234),
    yearsOfExperience: 0,
  );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    name: 'Ronan',
    address: Address(street: "123", city: "Phnom Penh", zipCode: 3234),
    yearsOfExperience: 20,
  );
  emp2.printDetails();
}
