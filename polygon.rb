require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '127.0.0.1:4567'
device     :sphero, :driver => :sphero

COLORS = %i[red yellow green blue white orange]

work do
  @rolling = false # is this doing anything?
  heading  = 0
  distance = 90
  sides    = 4

  sides.times do
    puts "Rolling #{distance} units at heading #{heading}..."
    sphero.set_color COLORS.sample
    sphero.roll distance, heading
    heading += (360 / sides)
    sleep 3
  end
end
