#!/usr/bin/env ruby

require 'rubygems'
require 'gosu'
require 'config'
require 'weapon'
require 'star'

class GameWindow < Gosu::Window

	@@speed_hor = 5
	@@speed_ver = 5
	@@timer_fire_blasters = Time.now.to_f

	@@weapon = "The resonance of souls"

  def initialize 
    super(Config::WINDOW_WIDTH, Config::WINDOW_HEIGHT, false)
    self.caption = "Fly"
		@star = Gosu::Image.new(self, "images/stars/2.png", false)
    @fly = Gosu::Image.new(self, "images/ships/main.png", false)
    @x = @y = 320

		@my_bulets = []
		@stars = []

		
  end

  def update

    if button_down? Gosu::Button::KbLeft or button_down? Gosu::Button::GpLeft
			unless @x <= 20
	      @x -= @@speed_hor
			end
    end

    if button_down? Gosu::Button::KbRight or button_down? Gosu::Button::GpRight
			unless @x >= (Config::WINDOW_WIDTH - 20)
	      @x += @@speed_hor
			end
    end

    if button_down? Gosu::Button::KbDown or button_down? Gosu::Button::GpDown
			if @y <= Config::WINDOW_HEIGHT - 25
	      @y += @@speed_ver
			end
    end

    if button_down? Gosu::Button::KbUp or button_down? Gosu::Button::GpUp
			if @y >= 30
	      @y -= @@speed_ver
			end
    end

    if button_down? Gosu::Button::KbSpace
			if @@timer_fire_blasters < (Time.now - 0.3).to_f
				@@timer_fire_blasters = Time.now.to_f
    		@my_bulets << Weapon.new(self, @x, @y, 1, @@weapon)
			end
    end

		if rand(100) < 5 && @stars.size < 25
			@stars << Star.new(@star)
		end

  end

  def draw
		@stars.each {|star|
			if star.y > Config::WINDOW_HEIGHT
				@stars.delete(star)
			else
				star.draw
			end
		}

    @my_bulets.each {|bulet|
			bulet.draw
			@my_bulets.delete(bulet) if bulet.y < -100
		}
    @fly.draw_rot(@x, @y, 1, 0.0)
  end	

  window = GameWindow.new
  window.show
end
