class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){Array.new}
    i = 0
    while i < @cups.length
      @cups[i] = [:stone, :stone, :stone, :stone] unless i == 6 || i == 13
      i += 1
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0
      raise "Invalid starting cup"

    else@cups[start_pos].length == 0
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    numbers = @cups[start_pos].length
    @cups[start_pos] = []
    i = 0
    while i < numbers
      index = (start_pos + 1 + i) % 14
      if current_player_name == @player1 && index == 13
        i += 1
        numbers += 1
        next
      end

      if current_player_name == @player2 && index == 6
        i += 1
        numbers += 1
        next
      end

      @cups[index] << :stone
      i += 1
    end
    render
    ending_cup_idx = (start_pos + i) % 14
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns
    #:switch, :prompt, or ending_cup_idx
    return :prompt if (ending_cup_idx == 6) || (ending_cup_idx == 13)
    return :switch if @cups[ending_cup_idx].length == 1
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
    @cups[0..5].all? { |arr| arr.empty?} || @cups[7..12].all? { |arr| arr.empty?}
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @player1 if @cups[6].length > @cups[13].length
    return @player2 if @cups[6].length < @cups[13].length
  end
end
