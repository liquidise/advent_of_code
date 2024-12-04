safe = 0
stable = 0
File.foreach( 'inputs/2.txt' ) do |line|
  datapoints = line.split( ' ' ).map( &:to_i )

  still_safe = true
  increasing = true
  last_item = nil
  stablized = false # Part 2 allows a single failure
  datapoints.each.with_index do |item, i|
    if i == 1
      increasing = last_item < item
    end

    if i > 0
      still_safe =
         (increasing && item >= last_item + 1 && item <= last_item + 3) ||
        (!increasing && item <= last_item - 1 && item >= last_item - 3)
    end

    if !still_safe && !stablized
      stablized = true
      still_safe = true
    elsif !still_safe
      break
    end

    last_item = item
  end

  if still_safe && !stablized
    safe += 1
  elsif still_safe
    stable += 1
  end
end

puts "Part A – Safe: #{safe}\nPart B – Safe or Stabilized: #{safe + stable}"
