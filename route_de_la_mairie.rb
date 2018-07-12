
require 'rubygems'
require 'nokogiri'
require 'open-uri'


######################################################recupere les mails
def get_the_email_of_a_townhal_from_its_webpage(url)
	
	#ouverture de l'url du ste de la ville
	doc = Nokogiri::HTML(open(url))

	#scrapping du mail de la mairie
	doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
	
end


#############################################################recupere les urls
def get_all_the_urls_of_val_doise_townhalls
	
	#Ouverture de l'url de l'annuaire des mairies du val d'oise
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css(".lientxt").each do |link|
		#Scrapping de l'url de chaque mairie
		url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s###decoupe le premir caractere de la chaine
		#Scrapping du nom de la ville
		ville_name = link.text
		#Scrapping de l'adresse mail de la mairie
		ville_email = get_the_email_of_a_townhal_from_its_webpage(url)
		#Le tout stoqué dans un hash
		ville = {:name => ville_name, :email => ville_email}
		puts  ville

	end

end

 get_all_the_urls_of_val_doise_townhalls

