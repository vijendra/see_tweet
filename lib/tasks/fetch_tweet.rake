namespace :data do
  desc "fetch all historical tweet ids starting from 2008 - jan"
  task :fetch_historic_tweets => :environment do
    puts "Started fetching old tweets from topsy."
    TopsyTweet.save_old_tweets
    puts "All old tweets are saved."
  end
  
  desc "fetch complete tweet details from twitter, for tweets fetched from topsy"
  task :update_topsy_tweets => :environment do
    puts "Started updating tweets."
    ProcessTweet.update_from_twitter
    puts "All tweets are saved."
  end
  
  desc "fetch all latest tweets from twitter"
  task :fetch_tweets => :environment do
    puts "Started fetching tweets."
    ['Quantified self', '#quantifiedself'].each do |search_term|
      TwitterTweet.fetch(search_term: search_term)
    end
      
    puts "All tweets are saved."
  end
  
  desc "fetch root tweets from twitter"
  task :fetch_roots => :environment do
    puts "Started fetching root tweets."
    ProcessTweet.fetch_root_tweets
    puts "All tweets are saved."
  end
end
