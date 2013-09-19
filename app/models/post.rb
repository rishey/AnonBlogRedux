class Post < ActiveRecord::Base
		  validates :body, presence: true
	  validates :title, presence: true
  # Remember to create a migration!
  has_and_belongs_to_many :tags
end
