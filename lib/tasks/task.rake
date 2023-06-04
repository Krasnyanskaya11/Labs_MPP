require 'nokogiri'
require 'open-uri'

namespace :hospitals do
  task parse_site: :environment do
    url = 'https://www.hospitalsafetygrade.org/all-hospitals'
    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'

    doc = Nokogiri::HTML(URI.open(url, 'User-Agent' => user_agent))

    doc.css('.column1 #BlinkDBContent_849210 ul li a').each do |link|
      name = link.text.strip
      dep = Clinic.new(name: name,
                       address: Faker::Address.full_address,
                       phone: Faker::PhoneNumber.cell_phone_with_country_code,
                       year_founded: Faker::Number.between(from: 1800, to: Date.today.year))


      dep.save
    end
  end
end