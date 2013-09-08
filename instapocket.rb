require 'rubygems' #usa gems
require 'nokogiri' #usa a gem para parsar o html
require "open-uri" #usa a gem para puxar links

puts "URL: " #pede para botar a link
remote_full_url = gets.chomp #prompt para botar a link
puts "Nome do ficheiro:" #pede para botar o nome que quero dar ao ficheiro
local_file_name = gets.chomp #prompt para botar nome do ficheiro
remote_data = Nokogiri::HTML(open(remote_full_url))   #para fazer o parse da link

my_local_filename = local_file_name + ".txt" # para criar um ficheiro com o nome que meti na prompt e com extensão txt
my_local_file = open(my_local_filename, "w") # cria o ficheiro que mencionei na linha anterior e permite escrever lá

my_local_file.write(remote_data.css("p", "a").text) #seleciona o texto <p> e os <a> do html da link e escreve no ficheiro criado
my_local_file.close #fecha o ficheiro.
remote_data.css("a").each{|link| puts "#{link.text}\t#{link['href']}"} 
puts "Terminado" #para saber que está feito
