require './menu.rb'

class Game

  # initialize this
  @players = Hash.new
  Player = Struct.new(:name, :marker)

  # start the game
  def start
    Menu.show_welcome

    # game loop
    until game_over?
      input = gets.chomp

      case input
        when '1'
          # instantiate players
          puts 'Player X, please choose your name: '
          px_name = gets.chomp
          puts 'Player O, please choose your name: '
          po_name = gets.chomp
          px = Player.new(px_name, 'X')
          po = Player.new(po_name, 'O')
          # add players to the game
          add_player(px)
          add_player(po)
        when '2'
          @quit = true
          stop
        else
          puts "Input '#{input}' is invalid!"
      end
    end

  end

  def stop
    puts "It was nice having you, bye!"
  end

  def game_over?
    @quit
  end

  def prompt_user
    input = gets.chomp
  end

  def add_player(player)
    p player
    p @players
    @players[player.marker.to_sym] = player
  end

  # defining scope
  public :start
  private :game_over?, :stop
end
