class CommentsController < ApplicationController

    # comment create
    # POST /comments.js
	def create
		user = User.find_or_create_by(email: params[:email].strip)
		comment = params[:comment].strip
		@comment = Comment.create(topic_id: params[:topic_id], user_id: user.id, value: comment)
	end

   # Show a single comment
   # GET  /comments/:id.js
	def show
		@comment = Comment.find params[:id]
	end

    # Upvote or downvote a comment. Also remember the action in a cookie
    # POST /comments/:id/vote/:direction.js
	def vote
		@comment = Comment.find(params[:id])

		# For each direction:
		# 1. increment / decrement vote count
		# 2. insert comment id in the cookie for that direction
		# 3. remove comment id in the cookie for other direction
		if params[:direction]=="up"
			@comment.vote_count += 1 if !(cookies[:all_ups] || "").split(",").include?(@comment.id.to_s)
			cookies[:all_ups] = ((cookies[:all_ups] || "").split(",") << @comment.id).uniq.join(",")
			cookies[:all_downs] = (cookies[:all_downs] || "").split(",") - [@comment.id.to_s]
		else
			@comment.vote_count -= 1 if !(cookies[:all_downs] || "").split(",").include?(@comment.id.to_s)
			cookies[:all_downs] = ((cookies[:all_downs] || "").split(",") << @comment.id).uniq.join(",")
			cookies[:all_ups] = (cookies[:all_ups] || "").split(",") - [@comment.id.to_s]
		end
		@comment.save
	end

end