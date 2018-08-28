class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    cups[6], cups[13] = [], []
    @cups = cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, 13)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos

    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if current_player_name == name1 && cup_idx == 13
        next
      elsif current_player_name == name2 && cup_idx == 6
        next
      end

      @cups[cup_idx] << stones.pop

    end

    render

    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
      @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    return name1 if @cups[6].count > @cups[13].count
    return name2
  end
end
