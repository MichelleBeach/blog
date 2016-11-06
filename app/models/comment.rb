class Comment < ActiveRecord::Base
  belongs_to :posts
  belongs_to :users

  validates_presence_of :user_id, :post_id, :body
end
