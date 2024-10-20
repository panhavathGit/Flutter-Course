class BankAccount {
  int accID;
  String accOwner;
  double amount;

  BankAccount(this.accID, this.accOwner, [this.amount = 0.0]);

  //Get the available account balance
  double get balance => this.amount;

  void credit(double depositAmt) {
    this.amount += depositAmt;
  }

  void withdraw(double withdrawAmt) {
    if (this.amount < withdrawAmt) {
      print("Insufficient balance!");
    } else {
      this.amount = this.amount - withdrawAmt;
      print("You have withdraw \$${withdrawAmt}, You now have \$${amount} in your account.");
    }
  }

  @override
  String toString() {
    return 'Account ID: $accID, Owner: $accOwner, Balance: \$${amount}\n';
  }
}

class Bank {
  String bankName;
  List<BankAccount> bankAccounts = [];

  Bank(this.bankName);

  BankAccount createAccount(int accID, String accOwner) {
    for (var acc in bankAccounts) {
      if (acc.accID == accID) {
        throw Exception("The ID ${acc.accID} is already exist!");
      }
    }

    var newAcc = BankAccount(accID, accOwner);
    bankAccounts.add(newAcc);

    return newAcc;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");

  BankAccount rozaAccount = myBank.createAccount(100, 'Roza');
  BankAccount vathAccount = myBank.createAccount(200, 'Vath');

  vathAccount.credit(1000);
  vathAccount.withdraw(100);

}
