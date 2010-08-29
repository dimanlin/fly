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

