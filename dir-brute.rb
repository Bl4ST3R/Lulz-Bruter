#Author : Bl4ST3R
#Free to use and modify !!!
require 'net/http'
require 'net/dns'


class String
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def bold;           "\e[1m#{self}\e[22m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
end



puts "\t\t=====================Lulzsec Bruter=====================".bold.blue

puts "\n "
puts "\t\t==================Credits to Fast Five==================".bold.blue
puts "\n"
#Websites IP 
puts "    Enter URL without http for IP ".bold.red


ipurl = gets.chomp
puts "\n "

packet = Net::DNS::Resolver.start(ipurl)
    answer = packet.answer
    answer.any? {|ans| p   ans}

puts "    Enter url with http".red.bold

url = gets.chomp  
puts "\n "
 
# replace list.txt with anyother wordlist file 
File.open("list.txt").readlines.each do |line|

     
    req = url+'/'+line.chomp+'/'
    res = Net::HTTP.get_response(URI.parse(req.strip))
    
  if res.code == "200"

     puts " #{req} ==> #{res.code}".red.bold

  elsif res.code == "301" or  res.code == "302"
     puts " #{req} ==> #{res.code}".red.bold.underline
  	
   
  else
     puts " #{req} ==> #{res.code}".green.bold
  end

end
