require 'watir-webdriver'
require 'page-object'
require 'sinatra'
require 'json'

class GoogleKhanPage
  include PageObject


    @s_string = "khan"

  form(:google_form, :id => 'gbqf')
      div(:result_stats, :id => 'resultStats' )
end

class GoogleResultsPage
    include PageObject

end

class KhanStats
   
    def initialize
        @browser = Watir::Browser.new
        @google_page = GoogleKhanPage.new @browser
    end

    def khan_string num
        @s_string = "Kh#{'a' * num}n"
    end

    def khan_count num
        @google_page.navigate_to("http://google.com/#q=" + khan_string(num))
        sleep 1
        results = @google_page.result_stats
        results.split(" ")[1].delete(",").to_i
    end

    def close
        @browser.close
    end
end

    
get '/khan' do
    khan_stats = KhanStats.new
    khan_array = []
    khan_array << ["KHANS", "SHATNERS"]

    2.upto(10) do |i|
        khan_array << [i, khan_stats.khan_count(i)]

    end
    khan_stats.close
    "var data = " + khan_array.to_json + ";"
end


