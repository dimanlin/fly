class Weapon < Gosu::Image

	attr_reader :weapon
	attr_reader :y

	@@bulets = {
							"The resonance of souls" => {:image => "images/weapon/the_resonance_of_souls.png", :speed => 5},
							"Shadowflame" => {:image => "images/ships/shadowflame.png"}
						}

	def initialize(window, x, y, guns = 1, weapon = "The resonance of souls")
		super(window, @@bulets[weapon][:image], false)
		@x = x
		@y = y
		@weapon = weapon
	end

	def draw
		self.draw_rot(@x, @y, 1, 0.0)
		@y -= @@bulets[@weapon][:speed]
	end

end
