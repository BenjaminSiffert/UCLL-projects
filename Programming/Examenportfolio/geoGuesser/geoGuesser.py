import os
import random

# ----------------------------
# Klassen Location en Game
# ----------------------------

class Location:
    def __init__(self, longitude, latitude, name, country):
        self._longitude = float(longitude)
        self._latitude = float(latitude)
        self.name = name
        self.country = country

    def verify_guess_is_close_enough(self, longitude, latitude):
        return abs(self._longitude - float(longitude)) <= 1 and abs(self._latitude - float(latitude)) <= 1

    def question_hard(self):
        return f"{self.name}:"

    def question_simple(self):
        return f"{self.name}, {self.country}:"

    def full_info(self):
        return f"{self.country}, {self.name}: ({self._longitude:.2f},{self._latitude:.2f})"


class Game:
    def __init__(self):
        self.locations = []
        self.score = 0
        self.n_games = 5  # default aantal rondes

    def get_score(self):
        return self.score

    def load_locations_from_file(self, filename):
        try:
            with open(filename, "r") as f:
                for line in f:
                    parts = line.strip().split(",")
                    if len(parts) == 4:
                        name, country, longitude, latitude = parts
                        loc = Location(longitude, latitude, name, country)
                        self.locations.append(loc)
        except FileNotFoundError:
            print(f"File {filename} not found!")

    def ask_number_of_rounds(self):
        max_rounds = min(20, len(self.locations))
        default = 5
        try:
            rounds = int(input(f"How many locations would you like to try to guess? (max = {max_rounds}, default = {default}): ") or default)
        except ValueError:
            rounds = default
        if rounds > max_rounds:
            rounds = max_rounds
        if rounds < 1:
            rounds = 1
        self.n_games = rounds

    def play_round(self, location):
        attempts = 2
        for i in range(attempts):
            print(f"\nAttempts left: {attempts - i}")
            if i == 0:
                prompt = location.question_hard()
            else:
                prompt = location.question_simple()
            print(prompt)
            try:
                guess_longitude = float(input("Longitude guess: "))
                guess_latitude = float(input("Latitude guess: "))
            except ValueError:
                print("Invalid input, counting as wrong attempt.")
                continue

            if location.verify_guess_is_close_enough(guess_longitude, guess_latitude):
                if i == 0:
                    self.score += 2
                else:
                    self.score += 1
                print(f"Congratulations! The answer was {location.full_info()}")
                break
            else:
                if i == 0:
                    print("Try again...")
                else:
                    print(f"Too bad! The answer was {location.full_info()}")

    def play_new_game(self, user):
        print(f"Starting a new game for {user}...")
        if not self.locations:
            print("No locations loaded. Cannot start the game.")
            return

        self.ask_number_of_rounds()
        available_locations = self.locations.copy()
        random.shuffle(available_locations)
        rounds_to_play = min(self.n_games, len(available_locations))

        for i in range(rounds_to_play):
            print(f"\n{rounds_to_play - i} locations left, your current score is {self.get_score()}")
            self.play_round(available_locations[i])
            print("\n---------------------------------------")

        print(f"\nGame over! Final score for {user}: {self.get_score()}")


# ----------------------------
# Speel het spel
# ----------------------------
if __name__ == "__main__":
    current_dir = os.path.dirname(__file__)
    file_path = os.path.join(current_dir, "locations.txt")  # correct pad naar het bestand

    geoguesser = Game()  # eerst het Game-object maken
    geoguesser.load_locations_from_file(file_path)
    geoguesser.play_new_game("Ruben")
