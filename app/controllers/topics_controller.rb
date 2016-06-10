class TopicsController < ApplicationController

	def index
		@topics = Topic.includes(:comments)
	end

	def show
		@topics = Topic.includes(:comments)
		@topic = Topic.find(params[:id])
		@comments = @topic.comments.order("created_at desc").includes(:user).paginate(page: params[:page], per_page: 10)
	    if request.xhr?
			render :partial=>"comments_list"
	    end
	end

end