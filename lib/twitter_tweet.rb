class TwitterTweet
  # This is used to collect latest tweets from twitter.  
   
  def self.fetch(params={})
    search_data = Twitter.search(params[:search_term], count: 100 )
 
    begin
      search_data.statuses.each do |status|
        self.create(status)
      end
      
      #get next set of result
      search_data = Twitter.search(params[:search_term], count: 100, max_id: search_data.statuses.last.id - 1)
 
    end while search_data.statuses.count == 100 #no more results will be returned in the next call
  end
 
  def self.create(status)
    tweet = Tweet.where(tweet_id: status.id.to_s).first 
    self.save(status) if tweet.blank?
  end
  
  def self.save(status)
    name = status.attrs["from_user_name"] #status.from_user_name throws error
    in_reply_to_status = status.attrs["in_reply_to_status_id_str"]
    in_reply_to_user = status.attrs["in_reply_to_user_id_str"]
    Tweet.create(tweet_id: status.id, body: status.text, from_user: status.from_user, 
                from_user_id: status.from_user_id, profile_image: status.user.profile_image_url, 
                from_user_name: name, iso_language_code: status.iso_language_code, 
                tweeted_on: status.created_at, in_reply_to_user_id_str: in_reply_to_user,
                ancestry: in_reply_to_status
                )
  end
  
  
end
