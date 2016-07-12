require "gosu"
# require 'collect_coins'

class Sprite
	def initialize window
		@window = window
		# @screen = Screen.new(self, @game)
		@background_image = Gosu::Image.new "back2.png", :tileable => true
		@width = @height = 160
		@idle = Gosu::Image.load_tiles(window, "ruby_pac_idle.png", @width, @height, true)
		# @move = Gosu::Image.load_tiles(@window, "ruby_pac_move.png", @width, @height, true)
		@x = @window.width/2 - @width/2
		@y = @window.height/2 - @height/2
		@direction = :right
		@frame = 0
	
	end

	def update 
		@frame += 1
		if @window.button_down? Gosu::KbLeft
			@direction = :left
			@x += -5 
		end
		if @window.button_down? Gosu::KbUp
			@direction = :up
			@y += -5
		end

		if @window.button_down? Gosu::KbRight
			@direction = :right
			@x += 5 
		end
		if @window.button_down? Gosu::KbDown
			@direction = :down
			@y += 5 
		end
	end

	def draw
		@background_image.draw 0, 0, 0

		f = @frame % @idle.size
		image = @idle[f]
		if @direction == :right
			image.draw @x, @y, 1
		else 
			image.draw @x + @width, @y, 1, -1, 1
		end
	end
end

class SpriteGame < Gosu::Window

	def initialize width = 800, height = 480, fullscreen = false 
		super
		self.caption = "Diana's Ruby Game"
	    @song = Gosu::Song.new self, "soundtrack.mp3"      
	    @song.play
		@sprite = Sprite.new self
	end 

	def button_down id
		close if id == Gosu::KbEscape
	end

	def update 
		@sprite.update
	end

	def draw 
		@sprite.draw
	end
end

SpriteGame.new.show