class PoliticalNews::Article

  attr_accessor :name, :author, :summary, :url, :source

  def self.today
    articles = []

    articles << PoliticalNews::Scraper.scrape_nytimes
    articles << PoliticalNews::Scraper.scrape_washpost
    articles << PoliticalNews::Scraper.scrape_buzzfeed_politics

    articles
  end
end
