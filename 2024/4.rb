def next_letters( x, dx, y, dy )
  letters = []
  3.times do |i|
    target_x = x + dx * (i + 1)
    target_y = y + dy * (i + 1)

    break if target_x >= @x_bound || target_y >= @y_bound || target_x < 0 || target_y < 0

    letters << @puzzle[ target_y ][ target_x ]
  end

  letters.join( '' )
end

@puzzle = File.read( 'inputs/4.txt' ).split( "\n" )
@x_bound = @puzzle.first.length
@y_bound = @puzzle.length

found = 0
mas_xs = 0
@puzzle.each.with_index do |row, y|
  row.chars.each.with_index do |letter, x|
    if letter == 'X'
      # Part A: Find "XMAS"
      words = []
      words << letter + next_letters( x, -1, y, -1 )
      words << letter + next_letters( x, 0,  y, -1 )
      words << letter + next_letters( x, 1,  y, -1 )

      words << letter + next_letters( x, -1, y, 0 )
      words << letter + next_letters( x, 1,  y, 0 )

      words << letter + next_letters( x, -1, y, 1 )
      words << letter + next_letters( x, 0,  y, 1 )
      words << letter + next_letters( x, 1,  y, 1 )

      found += words.count( 'XMAS' )
    elsif letter == 'A'
      # Part B: Find 2 "MAS"s shaped in an X
      words = []
      words << next_letters( x-2, 1, y-2, 1 )
      words << next_letters( x-2, 1, y+2, -1 )

      words << next_letters( x+2, -1, y-2, 1 )
      words << next_letters( x+2, -1, y+2, -1 )

      if words.count( 'MAS' ) == 2
        mas_xs += 1
      end
    end
  end
end

puts "Part A: #{found}\nPart B: #{mas_xs}"
