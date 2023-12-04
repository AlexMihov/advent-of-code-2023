def traverse(string, nrs)
  len = string.length
  hit = false

  (0..len).each do |i|
    hit = nrs.map { |n| (string[0..i]).include?(n[0]) }.reduce(&:&)
      return if hit
  end
end

input = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"

nrs = {
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  'zero' => 0
}

input = File.read('input_2.txt')

split_input = input.split("\n")

clean_input = split_input.map do |i|
  len = i.length
  cnt = 0
  while cnt <= len
    if traverse(i, nrs)
      sub = i[0..cnt]
      nrs.each do |k, v|
        swap = sub.match(k)
        i[0..cnt] = sub.gsub(k, v.to_s)
        break if swap
      end
    end
    cnt += 1
  end
  i
end

clean_input.each_with_index do |i, idx|
  puts "#{input.split("\n")[idx]}: #{i}" if i != input.split("\n")[idx]
end

puts clean_input
  .map { |i| i.gsub(/[a-zA-Z]*/, '') }
  .map { |d| "#{d[0]}#{d[-1]}".to_i}
  .sum
