class Game

  # start the game
  def start
    show_introduction
    self.prompt
  end

  def show_introduction
    puts %{
===========================================
      TIC TAC TOE : By Sava & Kevin
===========================================

Welcome to Tic Tac Toe. Play if you dare 😈

1. Start game
2. Quit

Choose your destiny..
    }
  end

  def stop
    puts "It was nice having you, bye!"
  end

  def game_over?
    @quit
  end

  # prompt
  def prompt
    until game_over?
      input = gets.chomp

      case input
        when 'q' then
          @quit = true
          self.stop
        else
          puts "Input '#{input}' is invalid!"
      end

    end
  end

  # defining scope
  public :prompt, :start
  private :game_over?, :stop, :show_introduction
end
