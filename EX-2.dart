// Bank Account

// Q1 - Decide which attributes make sense for a bank account

// Q2 – Implement the following methods
// balance(): - Returns the current balance
// withdraw(double amount) - - Deducts the given amount from the account balance.

// If the balance goes below 0, it should throw an exception.
// credit(double amount) - Adds the given amount to the account balance. 

enum AccountStatus { ACTIVE, BLOCKED, CLOSED }

class BankAccount {
  final String _accountNumber;
  final int _userId;
  double _balance;
  final AccountStatus _status;
  final int _pin;
  final String _fullName;

  String get accountNumber => _accountNumber;
  int get userId => _userId;
  double get balance => _balance;
  AccountStatus get status => _status;
  int get pin => _pin;
  String get fullName => _fullName;

  BankAccount{

  }

  void withdraw(double amount){
    if (_status == AccountStatus.BLOCKED) {
      throw Exception ("Account is blocked.");
      }

    if (_balance < amount) {
      throw Exception("Not enough balance."); }

    _balance = _balance - amount;

  }
  void credit(double amount){
    if (_accountNumber == null) {
      throw Exception ("Account not found.");
    }

    if (_status == AccountStatus.BLOCKED) {
      throw Exception("Account is blocked.");
      }

    _balance = amount + _balance;
  }

}

// Bank

// Q3 - Decide which attributes make sense for a bank  -
// The Bank class manages a list of accounts and ensures the uniqueness of each account ID.

// Q4 – Implement the following method
// Account createAccount(int accountId, String accountOwner) - - -
// Create a new bank account
// Ensure that the account ID is unique. Otherwise, throw an exception
// Add the account to the bank list and return it

// Q5 – Draw a UML class diagram that reflects your implementation.  -
// Attributes and methods of the BankAccount class. -
// The relationship between Bank and BankAccount (composition or aggregation)

class Address {
  final String street;
  final String city;
  final int zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

class Bank {
  final String _swift;
  final String _bankName;
  final Address _mainAddress;
  final String _contactNumber;
  final String _email;

  String get swift => _swift;
  String get bankName => _bankName;
  Address get mainAddress => _mainAddress;
  String get contactNumber => _contactNumber;
  String get email => _email;

  Bank{

  } 

  Account createAccount(int accountId, String accountOwner){
    
  }

}

void main() {
  // Bank myBank = Bank(name: "CADT Bank");
  // BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  // print(ronanAccount.balance); // Balance: $0
  // ronanAccount.credit(100);
  // print(ronanAccount.balance); // Balance: $100
  // ronanAccount.withdraw(50);
  // print(ronanAccount.balance); // Balance: $50

  // try {
  //   ronanAccount.withdraw(75); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Insufficient balance for withdrawal!
  // }

  // try {
  //   myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  // } catch (e) {
  //   print(e); // Output: Account with ID 100 already exists!
  // }
}
