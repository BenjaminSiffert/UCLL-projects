# Class recap

We've covered classes in Programming 1. Let's quickly recap the key concepts.

## An sample BankAccount class

We'll use the following class as a guide:

```python
class BankAccount:
    def __init__(self, owner):
        self.owner = owner
        self.__balance = 0
        self.__transactions = []

    def get_balance(self):
        return self.__balance

    def set_balance(self, amount):
        if amount < 0:
            raise ValueError("Balance cannot be negative.")
        self.__balance = amount

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit amount must be positive.")
        self.__balance += amount
        self.__log_transaction("deposit", amount)

    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError("Withdrawal amount must be positive.")
        if amount > self.__balance:
            raise ValueError("Insufficient funds.")
        self.__balance -= amount
        self.__log_transaction("withdraw", amount)

    def __log_transaction(self, transaction_type, amount):
        self.__transactions.append((transaction_type, amount))
        print(f"Logged {transaction_type} of amount: {amount}")

    def get_transaction_history(self):
        return self.__transactions.copy()
```

## Example Usage
```python
>>> my_bank_account = BankAccount("John Travolta")
>>> my_bank_account.get_balance()
0
>>> my_bank_account.owner
"John Travolta"
>>> my_bank_account.get_transaction_history()
[]

>>> my_bank_account.deposit(20)
>>> my_bank_account.get_balance()
20

>>> my_bank_account.withdraw(5)
>>> my_bank_account.get_balance()
15

>>> my_bank_account.get_transaction_history
[('deposit', 20), ('withdraw', 5)]

>>> my_bank_account.withdraw(100)
Traceback (most recent call last):
  File "bank_account.py", line 27, in withdraw
    raise ValueError("Insufficient funds.")
ValueError: Insufficient funds.

```


## In-detail Explanation
- The class itself is defined as `class ClassName:` (in this case `class BankAccount:`)
- To initialize instances of this class, we created a constructor (the `__init__` method).
    - `self` is the first argument that needs to be passed to all (we'll see exceptions later on in this course) methods of a class. It represents the instance we're calling the method on. For the constructor we don't need to pass this argument explicitly, as it's being created in this constructor. So we call the constructor like this: `my_bank_account = BankAccount("My name")`
    - This method takes the name of the bank account owner (`owner`).
    - The `balance` of the account is initialized to 0.
    - We'll also keep a transaction history keeping track of all the transaction. This attributes is initialized as an empty list.
- `owner` is public attribute, it can be set and inspected everywhere.
- `__balance` and `__transaction_history` are private attributes (due them starting with two underscores). Because of this, they cannot be (easily) accessed outside of this class.
- Instead, `balance` is defined as a private attribute with a getter method and a setter method.
    - The getter method simply returns the underlying private attribute `__balance`
    - The setter method ensures the balance will never be set to a negative value.
- In addition, there are two additional public methods that can be used to execute the two most common operations on the balance namely `deposit` and `withdraw`.
    - Both methods call the private helper method `__log_transaction`. We'll explain this method a bit later.
    - In addition, `deposit` also checks that the transaction being executed is in effect a deposit by checking the amount is positive. If it's not, it will raise an error.
    - Likewise, `withdraw` also checks that the transaction is a withdrawal by checking the amount is positive. (It should be positive because we subtract this amount).
    - Additionally `withdraw` also checks that the money we're trying to withdraw is more than the balance remaining in out account.
- The method `__log_transaction` is private as it should not be used outside of this class, it should only be used by other methods in this class (such as `deposit` and `withdraw`). It keeps track of all the transactions executed on this account by appending them to the private attribute `__transactions`. This is the only way this private attribute can be manipulated, as we have no setter method for it.
- Finally, we have the getter `get_transaction_history` which allows us to inspect the transaction history. Note that this getter does not allow us to modify the underlying `__transations` attribute, as it only returns a copy of that list, not the list itself.
```python
>>> my_bank_account.get_transaction_history().append(("fake transation", 20))
>>> my_bank_account.get_transaction_history()
[('deposit', 20), ('withdraw', 5)]
```

