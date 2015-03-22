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
end

class GameWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = 'Hello World'
    @background_image = Gosu::Image.new(self, "media/background.png", false)
    @player = Player.new(self)
  end

  def update
    @player.x -= 10 if button_down? Gosu::KbLeft
    @player.x += 10 if button_down? Gosu::KbRight
    @player.y += 10 if button_down? Gosu::KbDown
    @player.y -= 10 if button_down? Gosu::KbUp
  end

  def draw
    @background_image.draw(0, 0, 0)
    @player.draw
  end
end

GameWindow.new.show
