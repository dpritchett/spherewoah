def speaker_command
  if `which espeak`.empty?
    'voice'
  else
    'espeak'
  end
end

def say(text)
  system(speaker_command, text)
end

STDIN.each do |line|
  say line
end
