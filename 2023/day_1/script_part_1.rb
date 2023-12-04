input = File.read("input.txt")

input.split("\n").map{ |i| i.gsub(/[a-zA-Z]*/,'')}.map { |d| "#{d[0]}#{d[-1]}".to_i}.sum
