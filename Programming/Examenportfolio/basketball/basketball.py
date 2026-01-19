import os

# ========================
# BESTANDSPADEN
# ========================
BASE_DIR = os.path.dirname(__file__)
MATCH_DATA_FILE = os.path.join(BASE_DIR, "match_data.txt")
MATCH_STATS_FILE = os.path.join(BASE_DIR, "match_statistics.txt")
OUTPUT_FILE = os.path.join(BASE_DIR, "output.txt")


# ========================
# PLAYER
# ========================
class Player:
    def __init__(self, name, number):
        self.name = name
        self.number = number

        self.FGA = 0
        self.FGM = 0
        self.FTA = 0
        self.FTM = 0
        self.threePA = 0
        self.threePM = 0
        self.AS = 0
        self.RB = 0

    def add_FG(self, result):
        self.FGA += 1
        if result == "Scored":
            self.FGM += 1

    def add_FT(self, result):
        self.FTA += 1
        if result == "Scored":
            self.FTM += 1

    def add_3P(self, result):
        self.threePA += 1
        if result == "Scored":
            self.threePM += 1

    def add_AS(self):
        self.AS += 1

    def add_RB(self):
        self.RB += 1

    def get_statistics(self):
        return {
            "FGA": self.FGA,
            "FGM": self.FGM,
            "3PA": self.threePA,
            "3PM": self.threePM,
            "FTA": self.FTA,
            "FTM": self.FTM,
            "AS": self.AS,
            "RB": self.RB,
        }


# ========================
# TEAM
# ========================
class Team:
    def __init__(self, name, abbreviation):
        self.name = name
        self.abbreviation = abbreviation
        self.players = {}

    def add_player(self, name, number):
        self.players[number] = Player(name, number)

    def get_player_by_number(self, number):
        return self.players.get(number)

    def get_players(self):
        return self.players.values()


# ========================
# MATCH
# ========================
class Match:
    def __init__(self):
        self.teams = {}

    # ------------------------
    # MATCH DATA
    # ------------------------
    def read_match_data_file(self, filename):
        current_team = None

        with open(filename, "r", encoding="utf-8-sig") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue

                # TEAM lijn (case-insensitive)
                if line.lower().startswith("team"):
                    # split max 2 keer, zodat teamnaam met streepjes niet faalt
                    _, name, abbrev = [p.strip() for p in line.split("-", maxsplit=2)]
                    current_team = Team(name, abbrev)
                    self.teams[abbrev] = current_team

                # Speler lijn
                elif line.startswith("#") and current_team:
                    number, name = [p.strip() for p in line[1:].split("-", maxsplit=1)]
                    current_team.add_player(name, int(number))

    # ------------------------
    # MATCH STATISTICS
    # ------------------------
    def read_match_statistics_file(self, filename):
        with open(filename, "r", encoding="utf-8-sig") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue

                parts = [p.strip() for p in line.split(",")]

                team_abbrev = parts[0]
                number_str = parts[1]
                if number_str.startswith("#"):
                    number = int(number_str[1:])
                else:
                    number = int(number_str)

                stat_type = parts[2]

                team = self.teams.get(team_abbrev)
                if not team:
                    continue

                player = team.get_player_by_number(number)
                if not player:
                    continue

                if stat_type in ("FG", "FT", "3P"):
                    result = parts[3]
                    if stat_type == "FG":
                        player.add_FG(result)
                    elif stat_type == "FT":
                        player.add_FT(result)
                    elif stat_type == "3P":
                        player.add_3P(result)
                elif stat_type == "AS":
                    player.add_AS()
                elif stat_type == "RB":
                    player.add_RB()

    # ------------------------
    # DISPLAY / WRITE
    # ------------------------
    def display_match(self):
        lines = []

        for team in self.teams.values():
            lines.append("-" * 84)
            lines.append(f"| {team.name:<80}|")
            lines.append("-" * 84)
            lines.append("| Nbr | Name                         | FGA | FGM | 3PA | 3PM | FTA | FTM | AS | RB |")

            for p in team.get_players():
                s = p.get_statistics()
                lines.append(
                    f"| #{p.number:<2} | {p.name:<28} | "
                    f"{s['FGA']:<3} | {s['FGM']:<3} | {s['3PA']:<3} | {s['3PM']:<3} | "
                    f"{s['FTA']:<3} | {s['FTM']:<3} | {s['AS']:<2} | {s['RB']:<2} |"
                )

        lines.append("-" * 84)
        return "\n".join(lines)

    def write_match_details(self, filename):
        with open(filename, "w", encoding="utf-8") as f:
            f.write(self.display_match())

    # ------------------------
    # HELPERS
    # ------------------------
    def get_team_by_abbrev(self, abbrev):
        return self.teams.get(abbrev)

    def get_teams(self):
        return self.teams.values()


# ========================
# MAIN
# ========================
def main():
    match = Match()
    match.read_match_data_file(MATCH_DATA_FILE)
    match.read_match_statistics_file(MATCH_STATS_FILE)
    match.write_match_details(OUTPUT_FILE)


if __name__ == "__main__":
    main()

