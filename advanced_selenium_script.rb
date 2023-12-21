# advanced_selenium_script.rb

require 'selenium-webdriver'

class AdvancedGoogleSearch
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
  end

  def perform_search(query)
    @driver.get('https://www.google.com')
    search_box = @driver.find_element(name: 'q')
    search_box.send_keys(query)
    search_box.submit
  end

  def capture_screenshot(file_path)
    @driver.save_screenshot(file_path)
  end

  def get_search_results_titles(limit = 5)
    results = @driver.find_elements(css: 'h3')
    titles = results.take(limit).map(&:text)
    titles
  end

  def close_browser
    @driver.quit
  end
end

# Example usage:
search_instance = AdvancedGoogleSearch.new
search_instance.perform_search('OpenAI GPT-3')

# Capture screenshot
search_instance.capture_screenshot('screenshot.png')

# Get and print search results titles
results_titles = search_instance.get_search_results_titles
puts 'Search Results Titles:'
puts results_titles

search_instance.close_browser
