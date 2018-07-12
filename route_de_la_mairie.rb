=begin

def get_the_email_of_a_townhal_from_its_webpage
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |node|
	  puts node.text
	end
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css("a.lientxt").each do |link|
  	puts "#{link['href']}"
	end
end

get_all_the_urls_of_val_doise_townhalls

=end


def get_the_email_of_a_townhal_from_its_webpage
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").each do |node|
	  puts node.text
	end
end

get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
	require 'rubygems'
	require 'nokogiri'
	require 'open-uri'
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css("a.lientxt").each do |link|
  	puts "#{link['href']}"
	end
end

get_all_the_urls_of_val_doise_townhalls

