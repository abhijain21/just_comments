class CommentsController < ApplicationController

	def create
		user = User.find_or_create_by(email: params[:email].strip)
		comment = params[:comment].strip
		@comment = Comment.create(topic_id: params[:topic_id], user_id: user.id, value: comment)
	end

	def show
		@comment = Comment.find params[:id]
	end

	def vote
		@comment = Comment.find(params[:id])
		votes = @comment.vote_count
		@comment.vote_count = params[:direction]=="up" ? votes + 1 : votes - 1
		@comment.save
	end

end