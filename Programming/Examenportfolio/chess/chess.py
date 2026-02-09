import os

# FILE PATHS
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MOVEMENT_FILE = os.path.join(BASE_DIR, "movements.txt")
OUTPUT_FILE = os.path.join(BASE_DIR, "output.txt")  # <- correct bestand

# PIECE
class Piece:
    def __init__(self, code):
        self.code = code

    def get_code(self):
        return self.code

    def get_kind(self):
        return self.code[0]

    def get_player(self):
        return self.code[1]

# BOARD
class Board:
    def __init__(self):
        self.board = {}
        self._initialize_board()

    def _initialize_board(self):
        cols = "abcdefgh"
        # Zwart
        self.put_piece_on_position(Piece("Rb"), 'a8')
        self.put_piece_on_position(Piece("Nb"), 'b8')
        self.put_piece_on_position(Piece("Bb"), 'c8')
        self.put_piece_on_position(Piece("Qb"), 'd8')
        self.put_piece_on_position(Piece("Kb"), 'e8')
        self.put_piece_on_position(Piece("Bb"), 'f8')
        self.put_piece_on_position(Piece("Nb"), 'g8')
        self.put_piece_on_position(Piece("Rb"), 'h8')
        for c in cols:
            self.put_piece_on_position(Piece("pb"), f"{c}7")
        # Wit
        self.put_piece_on_position(Piece("Rw"), 'a1')
        self.put_piece_on_position(Piece("Nw"), 'b1')
        self.put_piece_on_position(Piece("Bw"), 'c1')
        self.put_piece_on_position(Piece("Qw"), 'd1')
        self.put_piece_on_position(Piece("Kw"), 'e1')
        self.put_piece_on_position(Piece("Bw"), 'f1')
        self.put_piece_on_position(Piece("Nw"), 'g1')
        self.put_piece_on_position(Piece("Rw"), 'h1')
        for c in cols:
            self.put_piece_on_position(Piece("pw"), f"{c}2")

    def put_piece_on_position(self, piece, position):
        self.board[position] = piece

    def get_piece_by_position(self, position):
        return self.board.get(position)

    def move_piece(self, start_pos, end_pos):
        if start_pos not in self.board:
            raise ValueError("Illegal move: no piece at start position")
        piece = self.board[start_pos]
        target_piece = self.board.get(end_pos)
        if target_piece and target_piece.get_player() == piece.get_player():
            raise ValueError("Illegal move: cannot move to friendly territory")
        self.board[end_pos] = piece
        del self.board[start_pos]

    def process_movements(self, movements):
        for start, end in movements:
            self.move_piece(start, end)

    def display_board_state(self):
        rows = []
        cols = "abcdefgh"
        for row in range(8, 0, -1):
            row_str = f"{row}: "
            for col in cols:
                pos = f"{col}{row}"
                piece = self.board.get(pos)
                if piece:
                    row_str += f"{piece.get_code():<3} | "
                else:
                    row_str += "    | "
            rows.append(row_str.rstrip())
        col_str = "    " + "   ".join(cols)
        rows.append(col_str)
        return "\n".join(rows)

    @staticmethod
    def read_movement_file(filename):
        movements = []
        with open(filename, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                start, end = [x.strip() for x in line.split(" - ")]
                movements.append((start, end))
        return movements

    def save_state(self, file_name):
        abs_path = os.path.abspath(file_name)
        with open(abs_path, "w", encoding="utf-8") as f:
            f.write(self.display_board_state())
        print(f"Board saved to: {abs_path}")  # bevestiging

# HELPER FUNCTION
def process_chess_moves(movement_file_name, output_file_name):
    board = Board()
    moves = Board.read_movement_file(movement_file_name)
    board.process_movements(moves)
    board.save_state(output_file_name)

# MAIN
if __name__ == "__main__":
    process_chess_moves(MOVEMENT_FILE, OUTPUT_FILE)
