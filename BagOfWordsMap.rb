
words_count = Hash.new()
puts("word\tcount")
STDIN.read.split("/n").each do |a|
	if(words_count[a].nil? == false) then
		words_count[a] += 1
	else 
		words_count[a] = 1
	end
end
for words_count.keys.each |word|
	puts("#{word}\t#{words_count[word]}")  
end