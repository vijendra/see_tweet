# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121125061520) do

  create_table "tweets", :force => true do |t|
    t.datetime "tweeted_on"
    t.string   "from_user"
    t.string   "from_user_id"
    t.string   "in_reply_to_user_id_str"
    t.string   "ancestry"
    t.string   "from_user_name"
    t.string   "tweet_id"
    t.string   "iso_language_code"
    t.string   "profile_image"
    t.string   "body"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "tweets", ["ancestry"], :name => "index_tweets_on_ancestry"
  add_index "tweets", ["tweet_id"], :name => "index_tweets_on_tweet_id"

end
