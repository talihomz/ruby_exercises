require './menu.rb'
require './board.rb'
require 'pp'

class Game

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
        # add player 1
        print 'Player X, please choose your name: '
        px_name = gets.chomp
        px = Player.new(px_name, 'X')
        add_player(px)

        # add player 2
        print 'Player O, please choose your name: '
        po_name = gets.chomp
        po = Player.new(po_name, 'O')
        add_player(po)

        @players_set = true

        puts "\n#{px.name} vs #{po.name}\n\n"
        @board.display
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

  def add_player(player)
    @players[player.marker.to_sym] = player
  end

  # defining scope
  public :start
  private :game_over?, :stop
end
