require 'gosu'

  
class Player

  attr_accessor :x, :y

  def initialize(window)
    @image = Gosu::Image.new(window, "media/player.png", false)
    @x, @y = 0, 0
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def move_left
    @x -=10 if @x > 10
  end

  def move_right
    @x += 10 if @x < 700
  end

  def move_up
    @y -= 10 if @y > 10
  end

  def move_down
    @y += 10 if @y < 450
  end

end

class GameWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = 'Hello World'
    @background_image = Gosu::Image.new(self, "media/background.png", false)
    @player = Player.new(self)
  end

  def update
    @player.move_left if button_down? Gosu::KbLeft
    @player.move_right if button_down? Gosu::KbRight
    @player.move_up if button_down? Gosu::KbUp
    @player.move_down if button_down? Gosu::KbDown
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player.draw
  end
end

GameWindow.new.show
