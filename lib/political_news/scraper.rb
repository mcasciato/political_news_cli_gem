class PoliticalNews::Scraper

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("http://www.nytimes.com/pages/politics/index.html"))

    article = PoliticalNews::Article.new
    article.name = doc.search("h2").first.text.strip
    article.author = doc.search("h6.byline").first.text.strip
    article.summary = doc.search("div.ledeStory p.summary").first.text.strip
    article.url = doc.search("h2 a").first.attr("href").strip
    article.source = "The New York Times"
    article
  end

  def self.scrape_washpost
    doc = Nokogiri::HTML(open("https://www.washingtonpost.com/politics/?nid=menu_nav_politics"))

    article = PoliticalNews::Article.new
    article.name = doc.search("h3").first.text.strip
    article.author = doc.search("div.story-list-meta-social ul li").first.text.strip
    article.summary = doc.search("div.story-description p").first.text.strip
    article.url = doc.search("h3 a").first.attr("href").strip
    article.source = doc.search("div #logo-in-nav a img").first["alt"]
    article
  end

  def self.scrape_buzzfeed_politics
    doc = Nokogiri::HTML(open("https://www.buzzfeed.com/politics"))

    article = PoliticalNews::Article.new
    article.name = doc.search("div.lede__body h2.lede__title").first.text.strip
    article.author = doc.search("div.small-meta__item").first.text.strip
    article.summary = doc.search("p.lede__kicker").first.text.strip
    article.url = "https://www.buzzfeed.com/politics" + doc.search("div.lede__body h2.lede__title a").first.attr("href").strip
    article.source = doc.search("div #logo a").first.text
    article
  end


end
