class Comment < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user

	validates :topic_id, :user_id, :value, presence: true

end
