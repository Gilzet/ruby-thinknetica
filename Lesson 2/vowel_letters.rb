puts "Program: vowel letters"

letters = ("a".."z").to_a
vowels = {}

letters.each_with_index{|letter, num| vowels[letter]=num+1 if %w[a e i о u y].include?(letter) }

print vowels