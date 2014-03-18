require 'artoo'
require 'artoo/robot'
require 'pry'


class Trainer < Artoo::Robot
  connection :sphero, adaptor: :sphero
  device     :sphero, driver:  :sphero
  api        host: '127.0.0.1', port: '4321'

  def initialize
    say "Go Sphero!"
    super(connections: { sphero: { port: '127.0.0.1:4567' } })
  end

  def say(text)
    puts text
    system "espeak", text
  end

  def change_color(new_color = nil)
    new_color ||= random_color
    say "Turning #{new_color}"
    #sphero.set_color(new_color)
  end

  def red
    change_color :red
  end

  def yellow
    change_color :yellow
  end

  def green
    change_color :green
  end

  def blue
    change_color :blue
  end

  def walkabout
    puts "Rolling..."
    sphero.roll 90, rand(360)
  end

  def square
    say "Drawing a square"
    [0, 90, 180, 270].each do |heading|
      sphero.roll 30, heading
      sleep 2
    end
  end

  private
  def random_color
    [:red, :green, :blue, :yellow].sample
  end

  def reverse(distance=90)
    sphero.roll(distance, 180)
  end

  def right(distance=90)
    sphero.roll(distance, 90)
  end

  #work do
    #@rolling = false

    #STDIN.each do |line|
      #instruction = line.to_sym

      #binding.pry
      #if respond_to?(instruction)
        #self.send(instruction)
      #else
        #puts "I don't know how to #{instruction}."
        ##puts self.inspect
        #binding.pry
      #end

      #sleep 1
    #end
  #end
end

Trainer.work!(Trainer.new)
