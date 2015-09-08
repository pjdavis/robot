class Robot

  attr_accessor :speed
  attr_accessor :direction

  def initialize
    @speed = 0
    @direction = "none"
  end

  def instruct(new_direction)
    # @direction = direction if @direction == "none"
    if @direction != new_direction
      if is_opposite(new_direction)
        @speed = @speed - 1
      else
        @direction = new_direction
        @speed = 1
      end
    else
      if @speed >= 4
        @speed = 0
      else
        @speed = speed + 1
      end
    end
  end

  def is_opposite(new_direction)
    direction_table = {
      "Forward": "Backward",
      "Backward": "Forward",
      "Left": "Right",
      "Right": "Left"
    }
    direction_table[self.direction.to_sym] == new_direction
  end

end
