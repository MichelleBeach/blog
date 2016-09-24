class Post < ActiveRecord::Base
  validates_presence_of :user_id, :body, :title
  belongs_to :user
end
