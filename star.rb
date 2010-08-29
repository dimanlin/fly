class Star

	attr_reader :y
	def initialize(animation, y = 0, speed = 1)
		@animation = animation
		@x = rand(Config::WINDOW_WIDTH)
		@y = y
		@speed = speed
	end

	def draw
		@animation.draw_rot(@x, @y, 1, 0.0)
		@y += @speed
	end
end

