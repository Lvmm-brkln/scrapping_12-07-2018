require 'rubygems'
require 'nokogiri'
require 'open-uri'




def depute(url)
	
	#ouverture de l'url du ste d'un depute
	doc = Nokogiri::HTML(open(url))

	#scrapping du mail du depute
	puts doc.css("dd a.email").map { |mail| mail['href'].sub("mailto:", "")}
	
end


#############################################################recupere les urls
def get_all_the_deputes
	
	#Ouverture de l'url de l'annuaire des deputes
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	doc.css("#deputes-list a").each do |link|
		#Scrapping de l'url de chaque depute
		url = "http://www2.assemblee-nationale.fr" + link["href"].to_s
		#Scrapping du nom du depute
		depute_name = link.text
		#Scrapping de l'adresse mail des deputes
		depute_email = depute(url)
		#Le tout stoqué dans un hash
		deputes = {:name => depute_name, :email => depute_email}
		puts  deputes

	end

end

 get_all_the_deputes