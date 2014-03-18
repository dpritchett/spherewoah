require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4567'
device     :sphero, :driver => :sphero

COLORS = %i[red yellow green blue white orange]

work do
  @rolling = false # is this doing anything?
  heading = 0
  distance = 90

  4.times do
    #@color = COLORS.sample
    puts "Rolling #{distance} units at heading #{heading}..."
    #sphero.set_color @color
    sphero.roll distance, heading
    heading += 90
    sleep (distance / 3)
  end
  break
end
