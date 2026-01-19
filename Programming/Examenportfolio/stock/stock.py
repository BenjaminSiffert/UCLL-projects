import os

# -------------------------------
# Klasse Part
# -------------------------------
class Part:
    def __init__(self, name, price):
        self.name = name
        self.price = price
        self.quantity = 0

    def get_quantity(self):
        return self.quantity

    def set_quantity(self, qty):
        if qty < 0:
            raise ValueError(f"Quantity for part {self.name} can't be negative")
        self.quantity = qty

    def info(self):
        return f"{self.name}: Price = {self.price:.2f}, Available Quantity = {self.quantity}"


# -------------------------------
# Klasse Stock
# -------------------------------
class Stock:
    def __init__(self):
        self.parts = {}

    def add_part(self, name, price, quantity):
        if name in self.parts:
            raise ValueError(f"Part with name {name} already exists in our stock")
        part = Part(name, price)
        part.set_quantity(quantity)
        self.parts[name] = part

    def get_part_by_name(self, name):
        if name not in self.parts:
            raise ValueError(f"Part {name} not found in stock")
        return self.parts[name]

    def get_parts(self):
        return self.parts.values()

    def remove_part(self, name):
        if name in self.parts:
            del self.parts[name]

    def restock_part(self, name, additional_quantity):
        part = self.get_part_by_name(name)
        part.set_quantity(part.get_quantity() + additional_quantity)


# -------------------------------
# Klasse Shop
# -------------------------------
class Shop:
    def __init__(self, name):
        self.name = name
        self._stock = Stock()
        # Pad naar bestanden in dezelfde map als script
        self.script_dir = os.path.dirname(os.path.abspath(__file__))
        self.stock_file = os.path.join(self.script_dir, "stock.txt")
        self.sales_file = os.path.join(self.script_dir, "sales.txt")

    def get_stock(self):
        return self._stock

    # Inladen van stock
    def load_stock_from_file(self):
        if not os.path.exists(self.stock_file):
            return
        with open(self.stock_file, "r") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                name, price, qty = line.split("|")
                self._stock.add_part(name.strip(), float(price), int(qty))

    # Stock wegschrijven
    def save_stock_to_file(self):
        with open(self.stock_file, "w") as f:
            for part in self._stock.get_parts():
                f.write(f"{part.name}|{part.price:.2f}|{part.get_quantity()}\n")

    # Stock tonen
    def display_stock(self):
        print("Current stock is:")
        for part in self._stock.get_parts():
            print(part.info())

    # Verkoop registreren
    def register_sale(self, part_name, sold_quantity):
        part = self._stock.get_part_by_name(part_name)
        if sold_quantity > part.get_quantity():
            raise ValueError(f"Not enough stock to sell {sold_quantity} units of {part_name}")
        part.set_quantity(part.get_quantity() - sold_quantity)
        # Schrijf naar sales.txt
        with open(self.sales_file, "a") as f:
            f.write(f"Sold {sold_quantity} item(s) from product {part.name} for price {part.price:.2f}\n")


# -------------------------------
# Menu en Main functie
# -------------------------------
def display_menu():
    print("\n===== IT Store Stock Management System =====")
    print("1. Add new part")
    print("2. Restock existing part")
    print("3. Sell part")
    print("4. View stock")
    print("5. Remove existing part")
    print("6. Exit")
    choice = input("Enter your choice: ")
    return choice

def main():
    shop = Shop("The IT Store")
    shop.load_stock_from_file()

    stop = False
    while not stop:
        choice = display_menu()

        if choice == '1':
            # Add new part
            name = input("Enter part name: ")
            price = float(input("Enter price: "))
            qty = int(input("Enter quantity: "))
            try:
                shop.get_stock().add_part(name, price, qty)
                print(f"{name} added to stock.")
            except ValueError as e:
                print(e)

        elif choice == '2':
            # Restock existing part
            name = input("Enter part name to restock: ")
            qty = int(input("Enter quantity to add: "))
            try:
                shop.get_stock().restock_part(name, qty)
                print(f"{qty} units added to {name}.")
            except ValueError as e:
                print(e)

        elif choice == '3':
            # Register Sale
            name = input("Enter part name to sell: ")
            qty = int(input("Enter quantity to sell: "))
            try:
                shop.register_sale(name, qty)
                print(f"{qty} units of {name} sold.")
            except ValueError as e:
                print(e)

        elif choice == '4':
            # Display Stock
            shop.display_stock()

        elif choice == '5':
            # Remove part
            name = input("Enter part name to remove: ")
            shop.get_stock().remove_part(name)
            print(f"{name} removed from stock.")

        elif choice == '6':
            # Exit and save
            shop.save_stock_to_file()
            print("Stock saved. Exiting...")
            stop = True

        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
#ej werk