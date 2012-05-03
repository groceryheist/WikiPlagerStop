require 'net/http'
require 'rexml/document'
puts("sectionId\tsectionParentId\tsectionXML")
#each article
xml_article = STDIN.read
doc = REXML::Document.new(xml_data)

doc.elements.each("*/section") do |element|
		puts("#{element.attributes["id"]}\t\"#{element.attributes[xml]}\"")
end
