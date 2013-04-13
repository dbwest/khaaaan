require 'watir-webdriver'
require 'page-object'

class GoogleKhanPage
  include PageObject

    @s_string = "khan"

  page_url "http://google.com/#q=#{}"
  form(:google_form, :id => 'gbqf')
      div(:result_stats, :id => 'resultStats' )
end

class GoogleResultsPage
    include PageObject

end

class KhanStats
   
    def khan_string num
        @s_string = "Kh#{'a' * num}n"
    end

    s_string = "Kh#{'a' * num}n"
    @browser = Watir::Browser.new
    google_page = GoogleKhanPage.new @browser
    google_page.goto
    results = google_page.result_stats
    p results.split(" ")[1].delete(",").to_i
    @browser.close
end
    

