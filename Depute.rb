require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def get_email(urlfiche)
	fiche_dep = Nokogiri::HTML(open(urlfiche))
	if fiche_dep.css("dd a.email")[1] == nil
		return "?"
	else
		fiche_dep.css("dd a.email")[1].text
	end
end

# => get email return une string : le mail 2 du député. Need une url complète.
# puts get_email('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036')


def get_all_url(urliste)
	list_alpha_deputes = Nokogiri::HTML(open(urliste))
	list_alpha_deputes.css("#deputes-list div ul li a").map {|part2| part2["href"] }.map {|part2| "http://www2.assemblee-nationale.fr" + part2}
end

# get_all_url retourne un array contenant les url complètes de fiches de députés. Elle prends la page de la liste alphabétique des députés sur le site off de l'assemblée en paramètre.

def get_first_name(urlfiche)
	fiche_dep = Nokogiri::HTML(open(urlfiche))
	fiche_dep.css("#haut-contenu-page article div h1").text.split[1]
end

# get_first_name récupère le prénom de splitant la string du nom et en récupérant le bloc 2 soit index 1.

def get_last_name(urlfiche)

	fiche_dep = Nokogiri::HTML(open(urlfiche))

	fiche_dep.css("#haut-contenu-page article div h1").text.split[-1]

end

# get_last_name récupère l'index le plus à drotie de la string... fonctionne comme get_first_name.

#puts get_first_name('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA718768')

array = []
clean = Hash.new

get_all_url('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique').each do |url|

#puts	get_first_name(url)
clean[:fn] = get_first_name(url)
#puts    get_last_name(url)
clean[:ln] = get_last_name(url)
#puts 	get_email(url)
clean[:em] = get_email(url)

puts clean
array << clean
end

puts array
