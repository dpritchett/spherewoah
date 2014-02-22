require 'curses'

Curses.noecho

loop do
  c = Curses.getch
  print "#{c}\r\n"
  STDOUT.flush
end
