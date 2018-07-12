require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_currencies
  page = Nokogiri::HTML(open("https://coinmarketcap.com/fr/all/views/all/"))
hash = {}
  page.css('.price').each do |url| 
    hash[url.text] = url['href'].sub("/fr/currencies/", "").sub("/#markets", "")
  end
   hash['taux'] << ('td.percent-change')
  return hash.invert
end
get_currencies.each do |name,link|
  puts "#{name} #{link}"
end