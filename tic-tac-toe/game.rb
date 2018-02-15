require './menu.rb'
require './board.rb'
require 'pp'

class Game

  attr_reader :players

  Player = Struct.new(:name, :marker)

  # initialize this
  def initialize
    @players = Hash.new
    @players_set = false
    @board = Board.new
  end

  # start the game
  def start
    Menu.show_welcome

    # game loop
    until game_over?
      input = gets.chomp

      if(input == '1' && !@players_set)

        # add players
        add_player('X')
        add_player('O')

        Menu.show_game(self)

        @board.display
        @players_set = true
        @current_player = 'O'

        play_game

      elsif(input == '2')
        puts "Are you sure you want to quit? (y/n)"
        response = gets.chomp

        if response.downcase == 'y'
          @quit = true
          stop
        end
      else

        #now we play
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

  def add_player(symbol)
    print "Player #{symbol}, please choose your name: "
    player_name = gets.chomp
    player = Player.new(player_name, symbol)
    @players[player.marker.to_sym] = player
  end

  def play_game

    stop_game = false

    until stop_game
      # 1. Prompt player for Input
      print "#{@players[@current_player.to_sym].name}'s turn: "
      player_input = gets.chomp

      if(player_input == '2')
        puts "Are you sure you want to quit? (y/n)"
        response = gets.chomp

        if response.downcase == 'y'
          stop_game = true
          @players_set = false
          Menu.show_welcome
        end
      else
        # 2. Show on screen
        puts "You played on slot #{player_input}"

        # 3. Switch current player
        @current_player = @current_player == 'O' ? 'X' : 'O'
      end

    end

  end

  # defining scope
  public :start
  private :game_over?, :stop
end
