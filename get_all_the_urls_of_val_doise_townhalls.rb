require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_all_the_urls_of_val_doise_townhalls

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

url = page.css(".lientxt").each do |lien|
puts "http://annuaire-des-mairies.com" + lien['href'][1..-1]
end
end

get_all_the_urls_of_val_doise_townhalls
