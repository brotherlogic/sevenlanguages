puts "Hello, world."

puts "Helo, Ruby".index("Ruby")

i = 0
while i < 10
  puts "Simon"
  i = i + 1
end

i = 1
while i < 11
  puts "This is sentence number #{i},"
  i = i + 1
end

r_num = rand(10)
puts "Guess a number between 0 and 9"
response = gets
if response.to_i < r_num
  puts "Too Low"
elsif response.to_i > r_num
  puts "Too High"
else
  puts "Spot on"
end
