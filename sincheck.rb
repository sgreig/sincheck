# Initialize variables.
sin_array = []
second_numbers = []
remaining_numbers = []
sum1 = 0
sum2 = 0
total = 0
total2 = 0
final = 0

puts "Welcome to SINCheck!"
puts "Please enter the SIN you'd like to verify (Format: XXXXXXXXX)"
sin = gets.chomp

# Convert the users input into an array and convert each array item to an integer.
sin_array = sin.split("").map { |s| s.to_i }

# Extract the last digit of the array to use as the check digit.
check_digit = sin_array.pop
puts "The check digit is #{check_digit}."

# Iterate through every 2nd item of the remaining array numbers, multiply them by 2 and if the number is > 9, subtract 9 from the number
puts "Doubling every other number..."
(1...sin_array.length).step(2).each do |x|
	y = sin_array[x] * 2
	puts y
	y -= 9 if y > 9
	second_numbers << y
end

# Create an array of the remaining numbers.
(0...sin_array.length).step(2). each { |x| remaining_numbers << x }

# Get sums of the two new arrays
second_numbers.each { |x| sum1 += x }
remaining_numbers.each { |x| sum2 += x }
puts "Sum of every other number is: #{sum1}"
puts "Sum of the remaining numbers is: #{sum2}"

# Get total.
total = sum1 + sum2
puts "Total of both sums is: #{total}"

# Determine if total is a multiple of 10. If so, see if check digit is 0. Otherwise, subtract total from the nearest 
if total % 10 == 0 && check_digit == 0
	puts "Total is a multiple of 10 and the check digit is 0. This is a valid SIN."
elsif total % 10 != 0
	total2 = (total / 10.0).round * 10
	total2 += 10 if total2 < total
	puts "Next highest number ending in 0 is: #{total2}"
	final = total2 - total
	puts "#{total2} - #{total} = #{final}"
	if final == check_digit
		puts "#{final} and #{check_digit} match. This is a valid SIN."
	else
		puts "#{final} and #{check_digit} don't match. This SIN is invalid."
	end
else
	puts "#{total} is a multiple of 10, but the check digit is #{check_digit}. This SIN is invalid."
end