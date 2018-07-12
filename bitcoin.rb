require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crypto(url)

    doc = Nokogiri::HTML(open(url))   rescue false
    
    hash = {}
    
    	#recupere le nom de la cryptomonnaie
        name_crypto =  doc.css('#currencies-all tbody tr')
    if doc

        
        
        name_crypto.each{ |x|
            #creation du hash qui sera dans le hash du name crypto
            hash2 = {}
            hash2['price'] = x.css('td a.price').text
            hash2['taux'] = x.css("[@data-timespan='1h']").text
            

            #enregistre le deuxième hash dans le hash principal contenant les noms des cryptomonnaies
            hash[x.css('td a.currency-name-container').text] = hash2
            
            
        }
    end
    
    puts hash
end #get_the_cours_cryptomonnaies    

 crypto("https://coinmarketcap.com/all/views/all/") 