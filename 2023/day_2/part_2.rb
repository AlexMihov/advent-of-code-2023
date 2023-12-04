# input = File.read('example_input.txt')
input = File.read('real_input.txt')

input = input.gsub(/Game \d+: /, '')
input = input.gsub(/;/, ',')

lines = input.split("\n")

games = lines.map.with_index do |l, index|
  entries = l.split(', ')
  tokens = entries.map do |entry|
    k, v = entry.split(' ')
    Hash[v => k.to_i]
  end
  Hash[index + 1 => tokens]
end

final_tally = games.map.with_index do |game, index|
  { }.merge *game[game.keys[0]].sort_by { |m| m[m.keys[0]] }
end

puts final_tally.map(&:values).map{ |idk| idk.reduce(1, &:*) }.sum
