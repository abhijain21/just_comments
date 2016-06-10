class TopicsController < ApplicationController

	def index
		@topics = Topic.includes(:comments)
	end

	def show
		@topics = Topic.includes(:comments)
		@topic = Topic.find(params[:id])

		@comments = @topic.comments.includes(:user)
	end
	
end