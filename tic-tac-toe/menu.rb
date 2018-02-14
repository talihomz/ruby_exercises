class Menu

  @@menu_header = %{
===========================================
   TIC TAC TOE : By Sava & Kevin
===========================================

Welcome to Tic Tac Toe. Play if you dare 😈
  }

  def self.show_welcome
   content = %{
     1. Start game
     2. Quit

     Choose your destiny..
   }

   puts "#{@@menu_header}#{content}"
  end

end
