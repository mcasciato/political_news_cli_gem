class PoliticalNews::News

  attr_accessor :name, :author, :summary, :url

  def self.today
  #Scrape Washington Post and New York Times and return newest articles on politics
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []

    articles << self.scrape_nytimes
    articles << self.scrape_washpost


    # Go to New York Times, find article
    # Extract properties
    # instantiate article

    # Do same for washington post
     articles 
  end

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("http://www.nytimes.com/pages/politics/index.html"))


    article = self.new
    article.name = doc.search("h2").first.text.strip
    article.author = doc.search("h6.byline").first.text.strip
    article.summary = doc.search("div.ledeStory p.summary").first.text.strip
    article.url = doc.search("h2 a").first.attr("href").strip
    article 

  end

  def self.scrape_washpost
    doc = Nokogiri::HTML(open("https://www.washingtonpost.com/politics/?nid=menu_nav_politics"))

    article = self.new
    article.name = doc.search("h3").first.text.strip
    article.author = doc.search("div.story-list-meta-social ul li").first.text.strip
    article.summary = doc.search("div.story-description p").first.text.strip
    article.url = doc.search("h3 a").first.attr("href").strip
    article 

  end

end