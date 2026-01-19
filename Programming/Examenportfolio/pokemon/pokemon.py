import os
# nodig voor Paths
BASE_DIR = os.path.dirname(__file__)
POKEMON_FILE = os.path.join(BASE_DIR, "pokemons.txt")
PROGRESS_FILE = os.path.join(BASE_DIR, "progress.txt")


# Class Pokemon
class Pokemon:
    def __init__(self, number, name, type_):
        self.number = number
        self.name = name
        self.type = type_
        self.name_found = False
        self.type_found = False

# Class Pokedex
class Pokedex:
    def __init__(self):
        self.pokemons = {}

    def add_pokemon(self, number, name, type_):
        self.pokemons[name.lower()] = Pokemon(number, name, type_)

    def get_pokemon_by_name(self, name):
        return self.pokemons.get(name.lower())

    def add_progress(self, name, type_):
        pokemon = self.get_pokemon_by_name(name)
        if not pokemon:
            raise ValueError("Pokemon not found")

        pokemon.name_found = True
        if type_ is not None:
            pokemon.type_found = True

    def check_pokemon(self, name, type_):
        pokemon = self.get_pokemon_by_name(name)

        if not pokemon:
            return f"{name} is not the name of a Pokemon"

        # Naam nog niet gevonden
        if not pokemon.name_found:
            pokemon.name_found = True

            if type_ is None:
                return f"Congratulations. You have found {pokemon.name}"

            if type_.lower() == pokemon.type.lower():
                pokemon.type_found = True
                return (
                    f"Congratulations. You have found {pokemon.name} - "
                    f"Congratulations, You have found the type for pokemon {pokemon.name}"
                )
            else:
                return (
                    f"Congratulations. You have found {pokemon.name} - "
                    f"{type_} is not the correct type for pokemon {pokemon.name}"
                )

        # Naam al gevonden
        if type_ is None:
            return f"You have already found {pokemon.name}"

        if pokemon.type_found:
            return (
                f"You already found the type for pokemon {pokemon.name}, "
                f"so your guesses were ignored"
            )

        if type_.lower() == pokemon.type.lower():
            pokemon.type_found = True
            return (
                f"You have already found {pokemon.name} - "
                f"Congratulations, You have found the type for pokemon {pokemon.name}"
            )
        else:
            return (
                f"You have already found {pokemon.name} - "
                f"{type_} is not the correct type for pokemon {pokemon.name}"
            )

    def display_pokedex(self):
        lines = ["#" * 20, "#" * 20]

        for pokemon in sorted(self.pokemons.values(), key=lambda p: p.number):
            name = pokemon.name if pokemon.name_found else "???"
            type_ = pokemon.type if pokemon.type_found else "???"
            lines.append(f"{pokemon.number} | {name} | {type_}")

        lines.extend(["#" * 20, "#" * 20])
        return "\n".join(lines)

    def write_progress(self, filename):
        with open(filename, "w") as f:
            for pokemon in self.pokemons.values():
                if pokemon.name_found:
                    if pokemon.type_found:
                        f.write(f"{pokemon.name},{pokemon.type}\n")
                    else:
                        f.write(f"{pokemon.name},\n")


# File functies
def read_pokemon_data(filename):
    data = []
    with open(filename, "r") as f:
        for line in f:
            number, name, type_ = line.strip().split(",")
            data.append((number, name, type_))
    return data


def read_progress_data(filename):
    progress = []
    if not os.path.exists(filename):
        return progress

    with open(filename, "r") as f:
        for line in f:
            parts = line.strip().split(",")
            name = parts[0]
            type_ = parts[1] if len(parts) > 1 and parts[1] != "" else None
            progress.append((name, type_))
    return progress


# Game logic
def play_game():
    pokedex = Pokedex()

    # Pokemon laden
    for number, name, type_ in read_pokemon_data(POKEMON_FILE):
        pokedex.add_pokemon(number, name, type_)

    # Progress laden
    for name, type_ in read_progress_data(PROGRESS_FILE):
        pokedex.add_progress(name, type_)

    stop_game = False

    while not stop_game:
        choice = input(
            "What do you want to do? (G)uess Pokemon - (S)how Status - (Q)uit? "
        ).strip().upper()

        if choice == "G":
            name = input("Please enter the name of the Pokemon: ").strip()
            type_input = input(
                "Please enter the type for this Pokemon (leave blank if you don't want to guess the type): "
            ).strip()
            type_ = type_input if type_input else None

            print(">>>", pokedex.check_pokemon(name, type_))

        elif choice == "S":
            print(pokedex.display_pokedex())

        elif choice == "Q":
            pokedex.write_progress(PROGRESS_FILE)
            print("Progress saved. Doei druif!")
            stop_game = True

        else:
            print("Invalid choice, please try again.")



play_game()
