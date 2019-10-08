require 'pp'
require 'nokogiri'
require 'curb'
require 'csv'
require 'choice'
IMAGE_LINK = "//img[@class='ml-img']/@src"
Choice.options do
  option :file do
    short '-f'
    long '--file=linkimage.csv'
    default 'linkimage.csv'
  end
  option :seed do
    short '-s'
    long '--seed=URL'
    default 'https://krutilka-rus.ru/inomarki/audi/'
  end
  def get_link(node)
    node.xpath("//img[@class='ml-img']/@src").text
    CSV.open(Choice[:file], "w") do |csv|
      csv << ["link"]
      prod = node.xpath("//img[@class='ml-img']/@src").text
      csv << prod
    end

  end

end