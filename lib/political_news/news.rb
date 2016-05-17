class PoliticalNews::News

  attr_accessor :name, :author, :summary, :url, :source

  def self.today
  #Scrape New York Times, Washington Post, and TIME (change to Politico? other?)and return newest political articles
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []

    articles << self.scrape_nytimes
    articles << self.scrape_washpost
    articles << self.scrape_buzzfeed_politics

    # Go to New York Times, find article
    # Extract properties
    # instantiate article

    # Do same for washington post and TIME (change to Politico? other?)
     articles 
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("http://www.nytimes.com/pages/politics/index.html"))

    article = self.new
    article.name = doc.search("h2").first.text.strip
    article.author = doc.search("h6.byline").first.text.strip
    article.summary = doc.search("div.ledeStory p.summary").first.text.strip
    article.url = doc.search("h2 a").first.attr("href").strip
    article.source = doc.search("div #branding a img").first["alt"]
    article 
  end

  def self.scrape_washpost
    doc = Nokogiri::HTML(open("https://www.washingtonpost.com/politics/?nid=menu_nav_politics"))

    article = self.new
    article.name = doc.search("h3").first.text.strip
    article.author = doc.search("div.story-list-meta-social ul li").first.text.strip
    article.summary = doc.search("div.story-description p").first.text.strip
    article.url = doc.search("h3 a").first.attr("href").strip
    article.source = doc.search("div #logo-in-nav a img").first["alt"]
    article 
  end

  def self.scrape_buzzfeed_politics
     doc = Nokogiri::HTML(open("https://www.buzzfeed.com/politics"))
    
    article = self.new
    article.name = doc.search("div.lede__body h2.lede__title").first.text.strip
    article.author = doc.search("div.small-meta__item").first.text.strip
    article.summary = doc.search("p.lede__kicker").first.text.strip
    article.url = "https://www.buzzfeed.com/politics" + doc.search("div.lede__body h2.lede__title a").first.attr("href").strip
    article.source = doc.search("div #logo a").first.text
    article
  end
end