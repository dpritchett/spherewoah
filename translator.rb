def mappings
  { r: :red,
    b: :blue,
    g: :green,
    s: :square,
    t: :triangle,
    p: :pentagon,
  }
end

def translate(line)
  line.gsub!(/\s/, '')

  mappings[line.to_sym]
end

STDIN.each do |line|
  line.gsub!(/\s/, '')

  if (result = translate(line))
    print "#{line} -> #{result}\r\n"
    STDOUT.flush
    `espeak #{result}`
  end
end
