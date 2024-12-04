left_col = []
right_col = []

File.foreach( 'inputs/1.txt' ) do |line|
  nums = line.split( "   " )
  left_col << nums.first.to_i
  right_col << nums.last.to_i
end

left_col.sort!
right_col.sort!

sum = 0
similarity = 0
left_col.each.with_index do |num, i|
  sum += (num - right_col[i]).abs

  similarity += num * right_col.count(num)
end

puts "1a: #{sum}"
puts "1b: #{similarity}"
