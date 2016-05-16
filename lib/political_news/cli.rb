class PoliticalNews::CLI

  def call
    list_articles
    menu
  end

  def list_articles
    puts "Most Recent News in Politics:"
    @articles = PoliticalNews::News.today
    @articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.name} - #{article.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the article for more info, type list to see the articles again, or type exit:"
      input = gets.chomp.downcase
      
      if input.to_i > 0
        the_article = @articles[input.to_i-1]
        puts "#{the_article.name} - #{the_article.author}"
        puts "#{the_article.summary}"
        puts "#{the_article.url}"
      elsif input == "list"
        list_articles
      elsif input == "exit"
        goodbye
      else
        puts "Invalid option: type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back later for more great articles!"
  end
end