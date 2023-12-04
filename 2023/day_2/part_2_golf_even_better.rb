input = File.read('real_input.txt')
input = input.gsub(/Game \d+: /, '')
input = input.gsub(/;/, ',')

lines = input.split("\n")

games = lines.map do |l|
  l.split(', ').reduce({}) do |agg, entry|
    k, v = entry.split(' ')
    agg.tap { |a| a[v] = [(a[v] || 0), k.to_i].max }
  end
end

puts games.map(&:values).map { |idk| idk.reduce(&:*) }.sum
