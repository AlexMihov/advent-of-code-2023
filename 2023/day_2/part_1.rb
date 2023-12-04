# input = File.read('example_input.txt')
input = File.read('real_input.txt')

rules = {
  red: 12,
  green: 13,
  blue: 14
}

good_ids = []

input.split("\n").each_with_index do |line, index|
  failed = false
  line = line.gsub(/Game \d+: /, '')
  line.split(';').map do |l|
    res = l.strip.split(',').map do |i|
      Hash[i.split(' ')[-1] => i.split(' ')[0].to_i]
    end
    combined_results = res.inject(:merge)
    failed |= combined_results.keys.map { |k| combined_results[k] <= rules[k.to_sym] }.include?(false)
  end
  good_ids << index + 1 unless failed
end

puts good_ids.sum
