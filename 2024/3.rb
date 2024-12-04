def sum_for_line( line )
  valid = line.scan( /mul\(([0-9]{1,3}),([0-9]{1,3})\)/ )

  sum = 0
  valid.size.times do |i|
    nums = valid[ i ]
    sum += nums.first.to_i * nums.last.to_i
  end

  sum
end

content = File.read( 'inputs/3.txt' ).gsub( "\n", '' )

puts "Part A – Sum: #{ sum_for_line(content) }"


# Part B – respect do() and don't() calls
conditional_sum = 0
directives = content.split( 'do()' )
directives.each do |line|
  line = line.gsub( /don\'t\(\).*/, '' )

  conditional_sum += sum_for_line( line )
end

puts "Part B – Sum: #{conditional_sum}"
