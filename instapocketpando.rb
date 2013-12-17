require 'rubygems' 
require 'nokogiri' #gem to parse html
require "open-uri" 
remote_full_url = 'http://pando.com/author/ylevine/' #link to be parsed
remote_data = Nokogiri::HTML(open(remote_full_url))
remote_url =  remote_data.css('div.body h1.entry-title a.insta')[1]["href"]
remote_url_data = Nokogiri::HTML(open(remote_url))
my_local_filename = remote_url_data.css("title").text + ".txt" # the name of the file where the text will be copied will be the title of the article
my_local_file = open(my_local_filename, "w")  
my_local_file.write(remote_url)
my_local_file.write("
	
	")
my_local_file.write(remote_url_data.css("title").text)
my_local_file.write("
	
	")
my_local_file.write(remote_url_data.css("p", "a").text) #copies all the text in the <p> tag, including the text in <a> tags
my_local_file.close


#prints a list of hyperlinks included in the text on the comand line
 #bgwrapper div#page div#main.wrapper div.inner section.primary div#content div#posts ul#postlist li#post-119146.post div.body h1.entry-title a.insta
puts "Done"