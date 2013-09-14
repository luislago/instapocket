require "open-uri"

puts "original" 
original = gets.chomp #to insert the original site we want to copy and change

puts "new file name"
name = gets.chomp

input = File.open(open(original)) #opens the original site
indata = input.read() #reads the original site


filename = name + ".txt" #the new file will have the name i gave in 'name'
output = File.open(filename, 'w+') # it opens the file and it says that we can read and write there
output.write(indata) #copies the original to the new one
text = File.read(output)
replace = text.gsub(%r{<.*?>} , ' ') # %r{} is how I tell that it is a regex. <.*?> is a regex to select html tags
File.open(output, "w") {|file| file.puts replace} # replaces the tags with ' '

output.close()
input.close() #closes both files