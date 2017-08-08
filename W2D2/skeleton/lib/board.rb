require 'byebug'

class Board

  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){ }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
     @cups.map! do |cup|
       cup = [:stone,:stone,:stone,:stone] 
     end
     @cups[6]  = []
     @cups[13] = []
  end

  def valid_move?(start_pos)
    begin
      raise "Invalid starting cup" if start_pos.between?(0,@cups.length+1)
    end
  end

  def make_move(start_pos, current_player_name)
    player1 = false
    player1 = true if(current_player_name == @name1)

    hand = @cups[start_pos]

    @cups[start_pos] = []
    
    idx = start_pos
    until hand.empty?
      idx = 0 if idx ==13
      idx+=1
      if idx == 6
        @cups[6] << hand.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << hand.pop if current_player_name == @name2
      else
        @cups[idx] << hand.pop
      end
    end #hand.empty?

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
     if ending_cup_idx == 6 || ending_cup_idx == 13
       :prompt
     elsif @cups[ending_cup_idx].count == 1
       :switch
     end
      ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[7..12].empty? || @cups[0..5].empty?
  end

  def winner
    if @cups[13].length > @cups[6].length
      @name2
    else
      @name1
    end
  end
end
