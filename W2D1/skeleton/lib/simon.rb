require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
  def reset
    @sequence_length = 1
    @game_over = false
    @seq = []
    #play
  end

  def play
    puts "!Let's play Simon Says!"
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    round_success_message
    show_sequence
    require_sequence
    @sequence_length +=1
  end

  def show_sequence
    add_random_color
    puts "HERE WE GO!"
    seq = @seq.dup
    seq.each do |color|
     puts color
      sleep(1)
    end
  end

  def require_sequence
   # puts "READY?"
   # input = gets.chomp
    system("clear") 
    @seq.each do |color|
      input = gets.chomp
     if input != color
      @game_over = true
      return
     end
    end

  end

  def add_random_color
    i = rand(COLORS.length)
    @seq <<  COLORS[i].to_s
  end

  def round_success_message
    puts "NICE WORK!"
  end

  def game_over_message
    puts "***********Game Over**************"
  end

  def reset_game
    reset
  end
end
