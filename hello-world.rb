require 'gosu'

  
class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/player.png", false)
  end

  def draw
    @image.draw(0, 0, 1)
  end
end

  class GameWindow < Gosu::Window
    def initialize
      super(800, 600, false)
      self.caption = 'Hello World'
      @background_image = Gosu::Image.new(self, "media/background.png", false)
      @player = Player.new(self)
      @player2 = Player2.new(self)
    end

    def draw
      @player.draw
      @background_image.draw(0, 0, 0)
    end
  end

GameWindow.new.show
