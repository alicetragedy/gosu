require 'gosu'
  class GameWindow < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = 'Hello World'
      @background_image = Gosu::Image.new(self, "media/background.png", false)
    end

    def draw
      @background_image.draw(0, 0, 0)
    end
  end

GameWindow.new.show
