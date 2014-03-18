def translations
  @memo ||= Hash[open("./translations.txt").readlines.map(&:split)]
end

def translate(line)
  translations[line.chars.first]
end

STDIN.each do |line|
  line.gsub!(/\s/, '')

  if (result = translate(line))
    print "#{result}\r\n"
    STDOUT.flush
  end
end
