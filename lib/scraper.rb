require 'HTTParty'
require 'nokogiri'

class Scraper

  attr_accessor :parse_page

  def initialize
    doc = HTTParty.get("https://store.nike.com/gb/en_gb/pw/mens-lifestyle-shoes/7puZoneZoi3")
    @parse_page = Nokogiri::HTML(doc)
  end

  def get_names
    parse_page.css("div.grid-item-box").css("div.product-name").css("p").children.map {|name| name.text}.compact
  end

  def get_prices
    parse_page.css("div.grid-item-box").css("div.product-price").css("span.local").children.map {|price| price.text}.compact
  end

  def display
    prices = get_prices
    names = get_names

    (0...prices.size).each do |index|
      puts "- - -  Item no.: #{index + 1} - - -"
      puts "Name: #{names[index]}" + " | " + "Price: #{prices[index]}"
    end
  end
end
