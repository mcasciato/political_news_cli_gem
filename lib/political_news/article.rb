class PoliticalNews::Article

  attr_accessor :name, :author, :summary, :url, :source

  def self.today
    articles = []

    articles << PoliticalNews::Scraper.scrape_nytimes
    articles << PoliticalNews::Scraper.scrape_washpost
    articles << PoliticalNews::Scraper.scrape_buzzfeed_politics

    # Go to New York Times, find article
    # Extract properties
    # instantiate article

    # Do same for washington post and TIME (change to Politico? other? --> Buzzfeed)
     articles
  end
end
