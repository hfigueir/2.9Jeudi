require 'rubygems'
require 'nokogiri'
require 'open-uri'


# On déclare une méthode qui permet de récupérer l'adresse mail de la mairie
def get_the_email_of_a_townhal_from_its_webpage(url)

	#Ouverture de l'url du site de la ville
	page = Nokogiri::HTML(open(url))
	#Scrapping du mail de la mairie
	page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end

# On déclare une méthode qui récupère toutes les url des mairies du val d'oise et les stoquent
# dans un Hash avec le nom de la ville
def get_all_the_urls_of_val_doise_townhalls

	#Ouverture de l'url de l'annuaire des mairies du val d'oise
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.css(".lientxt").each do |lien|
		#Scrapping de l'url de chaque mairie
		url = "http://annuaire-des-mairies.com" + lien["href"][1..-1].to_s
		#Scrapping du nom de la ville
		ville_name = lien.text
		#Scrapping de l'adresse mail de la mairie
		ville_email = get_the_email_of_a_townhal_from_its_webpage(url)
		#Le tout stoqué dans un hash
		ville = {:name => ville_name, :email => ville_email}
		puts  ville

	end

end

 puts get_all_the_urls_of_val_doise_townhalls
