require 'rubygems'
require 'nokogiri'
require 'open-uri'



def depute





    depute_first_name = [] #création des tableaux de données nom, code postal et site internet
    depute_last_name = []
    depute_email = []
    my_hash = Hash.new #création du hash

    doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/"))

    i = 0

    doc.css('tr td p span a').each do |name|
        depute_first_name << name.text #scrap des données prénom des députés
    end

    sites = doc.css('a')
    lien = sites.each{|link| print link['href'] + " "}
    lien.each do |site| #scrap des sites internet
        depute_email << site.text
    end

    zip = doc.css('a').text #scrap des données code postal
        zip.each do |z| #scrap des sites internet
        depute_last_name << z.text
    end


    size = depute_first_name.length
    while i < size do #boucle pour ranger tableaux dans le hash
        my_hash[i][:name] = "#{depute_first_name[i]}"
         my_hash[i][:zipcode] = "#{depute_last_name[i]}"
        my_hash[i][:website] = "#{depute_email[i]}"
        i += 1 #évolution indice du hash
        my_hash << my_hash[i]
    end
    puts my_hash

end

