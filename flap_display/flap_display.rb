FLAPS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ?!@#&()|<>.:=-+*/0123456789"
NUMBER_FLAPS = FLAPS.size
 
def flap_display(lines, rotors)
  flap = FLAPS.chars
  lines.zip(rotors).map do |line, rotor|
    line.chars.each_with_index.map do |line_,index|
      flap[(flap.index(line_) + rotor[0..index].reduce(:+)) % NUMBER_FLAPS]
    end.join
  end
end

puts '-----------------------------'
puts flap_display(["CAT"],[[1, 13, 27]])
puts ''
puts '-----------------------------'
puts flap_display(["HELLO "],[[15, 49, 50, 48, 43, 13]])