require 'rubygems' 
require 'nokogiri' #gem to parse html
require "open-uri" 

puts "URL: "
remote_full_url = gets.chomp #link to be parsed
puts "File name" 
local_file_name = gets.chomp #the name of the file where the text will be copied
remote_data = Nokogiri::HTML(open(remote_full_url))   

my_local_filename = local_file_name + ".txt" # 
my_local_file = open(my_local_filename, "w") # creates the .txt file where the text will be copied
my_local_file.write(remote_full_url) #copies the URL to the file
my_local_file.write("
	
	") #paragraph
my_local_file.write(remote_data.css("title").text) #copies the html <title> tag to the file
my_local_file.write("
	
	")
my_local_file.write(remote_data.css("p", "a").text) #copies all the text in the <p> tag, including the text in <a> tags
my_local_file.close #closes the file
remote_data.css('p').css("a").each{|link| puts "#{link.text}\t#{link['href']}"} #prints a list of hyperlinks included in the text on the comand line
 
puts "Done"
