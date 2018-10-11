require 'nokogiri'
require 'open-uri'
require 'rubygems'

def get_the_email_of_a_townhal_from_its_webpage
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
  return page.css('.tr-last')[3].text.split(" ")[2] #https://www.techonthenet.com/css/selectors/last_child.php
end

puts get_the_email_of_a_townhal_from_its_webpage
