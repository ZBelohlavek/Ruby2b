class SixLittle
	attr_accessor :words, :hints, :tokens
	
	#make variables
	def initialize
		@words = []
		@tokens = []
		@hints = []
	end
	
	def ask
	#Gets words and check if correct length then asks for hints
		puts "Enter six words and six hints: "
		6.times do |i|
			print "Word ##{i + 1} (at least 4 characters): "
			word = gets.chomp
			until word.length >= 4
				print "Words need to be at least 4 characters. Please reenter word ##{i + 1}: "
				word = gets.chomp
			end
			print "Hint ##{i + 1}: "
			hint = gets.chomp
			@words << word
			@hints << hint
		end
	end
	
	#Shuffle words
	def readySet
		return if @words.empty?
		#https://ruby-doc.org/core-1.8.7/Array.html
		@tokens = @words.map { |word| word.scan(/.{1,2}/).map(&:capitalize) }.flatten.shuffle
	end
	
	def display
	#Displays Token as table then hints then finally the answer key
		puts "\nSix Little Words (Ruby)"
		puts "Tokens: "
		#https://apidock.com/ruby/Enumerable/each_slice
		@tokens.each_slice(4) { |row| puts row.join(' ') }
		puts "\nHints: "
		@hints.each { |hint| puts hint }
		puts "\nAnswer Key"
		puts @words.each_slice(3).map { |row| row.join(' ') }.join("\n")
	end
	
	def run
	#Clears arrays then runs
		@words.clear
		@hints.clear
		@tokens.clear
		ask
		readySet
		display
	end
end
