class Topic < ActiveRecord::Base
	has_many :comments

	validates :value, uniqueness: true
end
