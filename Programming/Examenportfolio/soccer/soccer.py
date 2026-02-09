import os

# Team klasse
class Team:
    def __init__(self, name):
        self.name = name
        self.games_played = 0
        self.games_won = 0
        self.games_lost = 0
        self.games_drawn = 0
        self.goals_scored = 0
        self.goals_conceded = 0

    def get_games_played(self):
        return self.games_played

    def get_goal_difference(self):
        return self.goals_scored - self.goals_conceded

    def get_points(self):
        return self.games_won * 3 + self.games_drawn

    def play(self, other_team, goals_for, goals_against):
        # Update this team
        self.games_played += 1
        self.goals_scored += goals_for
        self.goals_conceded += goals_against

        # Update other team
        other_team.games_played += 1
        other_team.goals_scored += goals_against
        other_team.goals_conceded += goals_for

        if goals_for > goals_against:
            self.games_won += 1
            other_team.games_lost += 1
        elif goals_for < goals_against:
            self.games_lost += 1
            other_team.games_won += 1
        else:
            self.games_drawn += 1
            other_team.games_drawn += 1

    # Optioneel: voor sorteren van de competitie
    def __lt__(self, other):
        if self.get_points() != other.get_points():
            return self.get_points() > other.get_points()
        if self.games_won != other.games_won:
            return self.games_won > other.games_won
        if self.get_goal_difference() != other.get_goal_difference():
            return self.get_goal_difference() > other.get_goal_difference()
        if self.goals_scored != other.goals_scored:
            return self.goals_scored > other.goals_scored
        return self.name < other.name

# Competition klasse
class Competition:
    def __init__(self):
        self.teams = {}

    def add_team(self, name):
        if name not in self.teams:
            self.teams[name] = Team(name)

    def get_team_by_name(self, name):
        if name not in self.teams:
            self.add_team(name)
        return self.teams[name]

    def update_competition(self, match_list):
        for team_a_name, team_b_name, score_a, score_b in match_list:
            team_a = self.get_team_by_name(team_a_name)
            team_b = self.get_team_by_name(team_b_name)
            team_a.play(team_b, score_a, score_b)

    def display_table(self):
        lines = ["Team          | Pld | Won | Tie | Lst | Gls+ | Gls- | Diff | Pts"]
        for team in self.teams.values():
            lines.append(
                f"{team.name:<14} | {team.games_played:<3} | {team.games_won:<3} | {team.games_drawn:<3} | {team.games_lost:<3} | {team.goals_scored:<4} | {team.goals_conceded:<4} | {team.get_goal_difference():<4} | {team.get_points()}"
            )
        return "\n".join(lines)

    def write_table(self, filename):
        with open(filename, "w") as f:
            f.write(self.display_table())

# Functie om match data in te lezen
def read_match_data_file(filename):
    matches = []
    with open(filename, "r") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            # Verwachte formaat: "team_a - team_b: score_a - score_b"
            teams_part, scores_part = line.split(":")
            team_a, team_b = [t.strip() for t in teams_part.split("-")]
            score_a, score_b = [int(s.strip()) for s in scores_part.split("-")]
            matches.append((team_a, team_b, score_a, score_b))
    return matches

# Functie om alles te verwerken
def process_match_data(match_data_file_name, output_file_name):
    # Debug: huidige werkmap
    print("Current working directory:", os.getcwd())
    
    print(f"Reading matches from {match_data_file_name}...")
    matches = read_match_data_file(match_data_file_name)
    print(f"{len(matches)} matches read.")
    
    competition = Competition()
    competition.update_competition(matches)
    
    competition.write_table(output_file_name)
    print(f"Output written to {output_file_name}")

# Main
if __name__ == "__main__":
    # Zorg dat match_data.txt in dezelfde map staat als dit script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    match_file = os.path.join(script_dir, "match_data.txt")
    output_file = os.path.join(script_dir, "output.txt")

    process_match_data(match_file, output_file)
