file = File.new( 'inputs/day_01_1.txt' )

increasing = 0
last = Float::INFINITY # Do NOT count the first row as increasing

file.each do |row|
  num = row.to_i
  if num > last
    increasing += 1
  end

  last = num
end

puts "Increasing: #{increasing}"
