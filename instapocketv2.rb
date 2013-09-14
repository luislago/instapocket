require 'rubygems' 
require 'nokogiri' #gem to parse html
require "open-uri" 

puts "URL: "
remote_full_url = gets.chomp #link to be parsed
puts "File name" 
local_file_name = gets.chomp #the name of the file where the text will be copied
remote_data = Nokogiri::HTML(open(remote_full_url))   

my_local_filename = local_file_name + ".xml" # 
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

#- manter a estrutura do html e transformar em xml, ou num html mais limpo. Dá jeito para imagens, por exemplo, em que a nova página pode manter as imagens todas originais (de preferencia as que fazem parte do texto)
#- se mantiveres a estrutura do html ou pelo menos arranjares maneira de a manipular, podes resolver o problema dos parágrafos se colarem uns aos outros: podes mandar o ruby por um "\n" a seguir a cada "</p>" ou algo semelhante.
#- arranjar maneira de detectar e remover o lodo dos lados e tudo o que vem depois do fim do texto: comentários, artigos relacionados, etc.
