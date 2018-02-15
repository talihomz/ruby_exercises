class Board

  def initialize
    @board_slots = [0, 0, 2, 0, 0, 1, 1, 2, 0]
  end

  def render_slot(value)
    case value
      when 0 then ' '
      when 1 then 'X'
      when 2 then 'O'
    end
  end

  def display
    puts "\n    A   B   C  "
    puts "  +---+---+---+"
    puts "1 | #{render_slot(@board_slots[0])} | #{render_slot(@board_slots[1])} | #{render_slot(@board_slots[2])} |"
    puts "  +---+---+---+"
    puts "2 | #{render_slot(@board_slots[3])} | #{render_slot(@board_slots[4])} | #{render_slot(@board_slots[5])} |"
    puts "  +---+---+---+"
    puts "3 | #{render_slot(@board_slots[6])} | #{render_slot(@board_slots[7])} | #{render_slot(@board_slots[8])} |"
    puts "  +---+---+---+\n\n"
  end

end

=begin

# visual  A1 A2 A3 B1 B2 B3 C1 C2 C3
#indices   0  1  2  3  4  5  6  7  8
b     =   [0, 0, 0, 0, 0, 0, 0, 0, 0 ]

Slots Array Hash
Empty 0     ' '
X     1     'X'
O     2     'O'

Win:

Horizontal Wins
A1 == B1 == C1
A2 == B2 == C2
A3 == B3 == C3

b[0] == b[3] == b[6]....b[n + 3]
b[1] == b[4] == b[7]....b[n + 3]
b[2] == b[5] == b[8]....b[n + 3]

Vertical Wins
A1 == A2 == A3
B1 == B2 == B3
C1 == C2 == C3

b[0] == b[1] = b[2]
b[0] == b[1] = b[2]
b[0] == b[1] = b[2]


Diagonal Wins
A1 == B2 == C3
A3 == B2 == C1

# visual  A1 A2 A3 B1 B2 B3 C1 C2 C3
#indices   0  1  2  3  4  5  6  7  8
b     =   [0, 0, 0, 0, 0, 0, 0, 0, 0 ]


possible_wins = [
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6]
]

win = possible_wins.first do |row|
  b[row[0]] == b[row[1]] == b[row[2]]
end
=end
