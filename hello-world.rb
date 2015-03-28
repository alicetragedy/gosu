require 'gosu'

WIDTH = 750
HEIGHT = 600
SPEED = 5

class Cupcake
  attr_reader :caught, :missed

  def initialize(window)
    @x = rand(WIDTH)
    @y = 0
    @image = Gosu::Image.new(window, "media/cake.png", false)
    @caught = 0
    @missed = 0
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def fall(player)
    @y += SPEED
    if @y >= HEIGHT-35
      if Gosu::distance(@x, 0, player.x, 0) <= 50
        @caught += 1
        true
      elsif Gosu::distance(@x, 0, player.x, 0) > 50
        @missed += 1
        true
      end
      @y = 0
      @x = rand(WIDTH)
    end
  end

end
  
class Player

  attr_accessor :x, :y

  def initialize(window)
    @image = Gosu::Image.new(window, "media/player.png", false)
    @x, @y = 0, 450
  end

  def draw
    @image.draw(@x, @y, 2)
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
    @cupcake = Cupcake.new(self)
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
  end

  def update
    @cupcake.fall(@player)
    @player.move_left if button_down? Gosu::KbLeft
    @player.move_right if button_down? Gosu::KbRight
    @player.move_up if button_down? Gosu::KbUp
    @player.move_down if button_down? Gosu::KbDown
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player.draw
    @cupcake.draw
    @font.draw("Caught: #{@cupcake.caught}", 10, 10, 0)
    @font.draw("Missed: #{@cupcake.missed}", 130, 10, 0)
  end
end

GameWindow.new.show
