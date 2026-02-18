class Customer:
    def __init__(self, name, age, country):
        self.name = name
        self.age = age
        self.country = country


class ShoppingList:
    def __init__(self, owner):
        self.__owner = owner
        self.__items = []

    @property
    def owner(self):
        return self.__owner

    def __len__(self):
        return len(self.__items)

    def __getitem__(self, index):
        return self.__items[index]

    def add(self, item):
        if not item.can_be_sold_to(self.owner):
            raise ValueError()
        self.__items.append(item)
        
class Item:
    def __init__(self, name, price):
        self.name = name
        self.price = price
    def can_be_sold_to(self, customer):
        if customer :
         return True
        else :
            raise ValueError("Customer is a non existing entity, plz stop breaking the laws of space and time")
        
class AgeRestrictedItem(Item):
    def can_be_sold_to(self, customer):
        if customer.age > 18:
         return True
        else :
            raise ValueError("Did you mean to get a happy meal?") 
class CountryRestrictedItem(Item):
    def can_be_sold_to(self, customer):
        if customer.country != "Arstotzka":
            raise ValueError("GLORY TO ARSTOTZKA!" + 50*"PEW PEW PEW PEW PEW PEW PEW PEW") 
        else :
            return True
    
    
customer1 = Customer("Janneke", 17, "Kolechia")
item1 = CountryRestrictedItem("vodka", 20)
shoppinglist1 = ShoppingList(customer1)
shoppinglist1.add(item1)