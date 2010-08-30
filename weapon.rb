class Weapon < Gosu::Image

	attr_reader :weapon
	attr_reader :y

	@@bulets = {
							"The resonance of souls" => {:image => "images/weapon/the_resonance_of_souls.png", :speed => 5},
							"Shadowflame" => {:image => "images/ships/shadowflame.png"}
						}

	def initialize(window, x, y, guns = 1, weapon = "The resonance of souls")
		super(window, @@bulets[weapon][:image], false)
		@guns = guns
		
		@coordinate = Array.new
		i = 1
		while i <= guns
			i = i + 1
			@coordinate << [x, y]
		end
		@weapon = weapon
	end

	def need_delete?
		@coordinate[0][0] < -100 ? true : false	
	end

	def draw
		grad = 12
		case @guns
			when 1
				self.draw_rot(@coordinate[0][0], @coordinate[0][1], 1, 0.0)
				@coordinate[0][1] -= @@bulets[@weapon][:speed]
			when 2
				self.draw_rot(@coordinate[0][0], @coordinate[0][1], 1, grad * -1)
				@coordinate[0][0] -= 1
				@coordinate[0][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[1][0], @coordinate[1][1], 1, grad)
				@coordinate[1][0] += 1
				@coordinate[1][1] -= @@bulets[@weapon][:speed]
			when 3
				self.draw_rot(@coordinate[0][0], @coordinate[0][1], 1, grad * -1)
				@coordinate[0][0] -= 1
				@coordinate[0][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[1][0], @coordinate[1][1], 1, 0.0)
				@coordinate[1][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[2][0], @coordinate[2][1], 1, grad)
				@coordinate[2][0] += 1
				@coordinate[2][1] -= @@bulets[@weapon][:speed]
			when 4
				self.draw_rot(@coordinate[0][0], @coordinate[0][1], 1, grad * -1)
				@coordinate[0][0] -= 1
				@coordinate[0][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[1][0] - 4, @coordinate[1][1], 1, 0.0)
				@coordinate[1][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[2][0] + 4, @coordinate[2][1], 1, 0.0)
				@coordinate[2][1] -= @@bulets[@weapon][:speed]

				self.draw_rot(@coordinate[3][0], @coordinate[3][1], 1, grad)
				@coordinate[3][0] += 1
				@coordinate[3][1] -= @@bulets[@weapon][:speed]
		end
	end

end
