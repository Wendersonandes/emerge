class CommentsController < ApplicationController

	def create
		commentable = commentable_type.constantize.find(commentable_id)
		@commentable = commentable
		@comment = Comment.build_from(commentable, current_user.id, body)

		respond_to do |format|
			if @comment.save
				format.html {redirect_to(:back)}
				format.js
			else
				format.html {render :action => "new"}
			end
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
	end

	def commentable_type
		comment_params[:commentable_type]
	end

	def commentable_id
		comment_params[:commentable_id]
	end

	def comment_id
		comment_params[:comment_id]
	end

	def body
		comment_params[:body]
	end

end
