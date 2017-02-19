


class User < ActiveRecord::Base
	has_many :posts
end


class Post < ActiveRecord::Base
	belongs_to :user
	# has_many :comments
	# validates :title, presence: true, length: { minimum: 3 }
	# validates :body, presence: true
end 

