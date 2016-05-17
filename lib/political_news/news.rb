class PoliticalNews::News

  attr_accessor :name, :author, :summary, :url, :source

  def self.today
  #Scrape New York Times, Washington Post, and TIME and return newest political articles
    self.scrape_articles
  end

  def self.scrape_articles
    articles = []

    articles << self.scrape_nytimes
    articles << self.scrape_washpost
    articles << self.scrape_time_mag

    # Go to New York Times, find article
    # Extract properties
    # instantiate article

    # Do same for washington post and TIME
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

  def self.scrape_time_mag
    doc = Nokogiri::HTML(open("http://time.com/politics/"))

    article = self.new
    article.name = doc.search("h2.section-article-title").first.text.strip
    #article.author = doc.search("div.story-list-meta-social ul li").first.text.strip
    #article.summary = doc.search("div.story-description p").first.text.strip
    article.url = doc.search("h2.section-article-title a").first.attr("href").strip
    article.source = doc.search("div.logo-wrap a img").first["alt"]
    article 
  end
end