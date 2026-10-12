// Bank Account

// Q1 - Decide which attributes make sense for a bank account

// Q2 – Implement the following methods
// balance(): - Returns the current balance
// withdraw(double amount) : - Deducts the given amount from the account balance.

// If the balance goes below 0, it should throw an exception.
// credit(double amount) : - Adds the given amount to the account balance.

enum AccountStatus { ACTIVE, BLOCKED, CLOSED }

class BankAccount {
  final String _accountNumber;
  double _balance;
  AccountStatus _status;
  final int _pin;
  final String _fullName;

  String get accountNumber => _accountNumber;
  double get balance => _balance;
  AccountStatus get status => _status;
  int get pin => _pin;
  String get fullName => _fullName;

  BankAccount({
    required String accountNumber,
    required String fullName,
    required int pin,
    double balance = 0,
    AccountStatus status = AccountStatus.ACTIVE,
  }) : _accountNumber = accountNumber,
       _fullName = fullName,
       _pin = pin,
       _balance = balance,
       _status = status;

  void withdraw(double amount) {
    if (_status != AccountStatus.ACTIVE) {
      throw Exception("Account is not active");
    }

    if (amount <= 0) {
      throw Exception("Withdraw amount must be greater than 0.");
    }
    if (_balance < amount) {
      throw Exception("Not enough balance.");
    }

    _balance = _balance - amount;
  }

  void credit(double amount) {
    if (_status != AccountStatus.ACTIVE) {
      throw Exception("Account is not active");
    }
    if (amount <= 0) {
      throw Exception("Deposit amount must be greater than 0.");
    }

    _balance = amount + _balance;
  }

  @override
  String toString() {
    return "Account: $_accountNumber \nOwner: $_fullName \nBalance $_balance/n Status: $_status";
  }
}

// Bank

// Q3 - Decide which attributes make sense for a bank
// - The Bank class manages a list of accounts and ensures the uniqueness of each account ID.

// Q4 – Implement the following method
// Account createAccount(int accountId, String accountOwner) -
// - Create a new bank account
// - Ensure that the account ID is unique. Otherwise, throw an exception
// - Add the account to the bank list and return it

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
  final String _name;
  final Address _mainAddress;
  final String _contactNumber;
  final String _email;
  final List<BankAccount> _accounts = [];

  String get swift => _swift;
  String get name => _name;
  Address get mainAddress => _mainAddress;
  String get contactNumber => _contactNumber;
  String get email => _email;
  List<BankAccount> get accounts => _accounts;

  Bank({
    required String swift,
    required String name,
    required Address mainAddress,
    required String contactNumber,
    required String email,
  }) : _swift = swift,
       _name = name,
       _mainAddress = mainAddress,
       _contactNumber = contactNumber,
       _email = email;

  BankAccount createAccount(int accountId, int pin, String accountOwner) {
    final bool accountExist = _accounts.any(
      (account) => account._accountNumber == accountId,
    );

    if (accountExist) {
      throw Exception("Account with ID $accountId already exists.");
    }

    final BankAccount account = BankAccount(
      accountNumber: accountId.toString(),
      fullName: accountOwner,
      pin: pin,
    );

    _accounts.add(account);

    return account;
  }
}

void main() {
  Bank myBank = Bank(
    swift: "CADTKH",
    name: "CADT Bank",
    mainAddress: Address(street: "123", city: "Phnom Penh", zipCode: 3234),
    contactNumber: "0223824729",
    email: "contact@cadtbank.com",
  );
  BankAccount ronanAccount = myBank.createAccount(100, 1234, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 2344, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
