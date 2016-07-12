require 'gosu'
 
 class GameWindow < Gosu::Window
   def initialize(width=500, height=500, fullscreen=false)
     super
     self.caption = "Diana's Pacman"
     @image = Gosu::Image. from_text self, 
                    "Use your arrow keys to start and play!",
                    Gosu.default_font_name,
                    30
    @song = Gosu::Song.new self, "pacman_beginning.wav"
    @song.play(true)
   end
 
   def update
   end
 
   def button_down id
     close if id == Gosu::KbEscape
   end
 
   def button_up id
     @buttons_down -= 1
   end
 
   def draw
     @image.draw  self.width/2 - @image.width/2,
                  self.width/2 - @image.width/2,
                  0
   end
 
 end
 
 window = GameWindow.new
 window.show