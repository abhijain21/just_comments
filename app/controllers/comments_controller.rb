class CommentsController < ApplicationController

	def create
		user = User.find_or_create_by(email: params[:email].strip)
		comment = params[:comment].strip
		@comment = Comment.create(topic_id: params[:topic_id], user_id: user.id, value: comment)
	end

end