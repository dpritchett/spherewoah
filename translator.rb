def rubric
  @memo ||= Hash[open("./rubric.txt").readlines.map(&:split)]
end

def translate(line)
  rubric[line.chars.first]
end

STDIN.each do |line|
  line.gsub!(/\s/, '')

  if (result = translate(line))
    print "#{result}\r\n"
    STDOUT.flush
  end
end
