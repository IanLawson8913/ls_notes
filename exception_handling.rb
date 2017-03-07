begin
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end

# useful for handling nil values

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end

# inline exception example

zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"

# Before each call
# Can't do that!
# After each call

# Here we are rescuing the ZeroDivisionError and saving it into a variable e. 
# We then have access to the message method that the ZeroDivisionError object has available.

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)