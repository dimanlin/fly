require 'rubygems'
require 'gosu'

class Bulet

	attr_reader :image, :x, :y, :speed

	def initialize(image, x = 320, y = 240, speed = 5)
		@y = y
		@x = x
		@speed = speed
		@image = image
	end

	def update
		@y -= @speed
	end

end

class GameWindow < Gosu::Window

	@@speed_hor = 5
	@@speed_ver = 5

  def initialize 
    super(1600, 1200, false)
    self.caption = "Fly"
    @fly = Gosu::Image.new(self, "images/ships/main.png", false)
    @fire = "images/ships/main.png"
    @x = @y = 320
		@my_bulets = []
  end

  def update
    if button_down? Gosu::Button::KbLeft or button_down? Gosu::Button::GpLeft
      @x -= @@speed_hor
    end

    if button_down? Gosu::Button::KbRight or button_down? Gosu::Button::GpRight
      @x += @@speed_hor
    end

    if button_down? Gosu::Button::KbDown or button_down? Gosu::Button::GpDown
      @y += @@speed_ver
    end

    if button_down? Gosu::Button::KbUp or button_down? Gosu::Button::GpUp
      @y -= @@speed_ver
    end

    if button_down? Gosu::Button::KbSpace
    	@my_bulets << Bulet.new(@fire, @x, @y)
    end

  end

  def draw
    @my_bulets.each {|bulet|
			Gosu::Image.new(self, bulet.image, false).draw_rot(bulet.x, bulet.y, 1, 0.0)
			bulet.update
			@my_bulets.delete(bulet) if bulet.y < -100
		}
    @fly.draw_rot(@x, @y, 1, 0.0)
  end	

  window = GameWindow.new
  window.show
end
