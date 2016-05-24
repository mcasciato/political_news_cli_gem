class PoliticalNews::Scraper

  def self.scrape_nytimes
    doc = Nokogiri::HTML(open("http://www.nytimes.com/pages/politics/index.html"))

    article = PoliticalNews::Article.new
    article.name = doc.search("h2").first.text.strip
    article.author = doc.search("h6.byline").first.text.strip
    article.summary = doc.search("div.ledeStory p.summary").first.text.strip
    article.url = doc.search("h2 a").first.attr("href").strip
    article.source = doc.search("div #branding a img").first["alt"]
    article
  end


end
