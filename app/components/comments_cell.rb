class CommentsCell < Cell::ViewModel
	include ActionView::RecordIdentifier
	
	property :body
	property :id
	property :comment_threads
	property :root_comments
	property :children
	property :comments
	property :user_id
	property :user

	def show
		render
	end

	def form
		@new_comment = Comment.build_from(model, current_user.id, "")
		render
	end

	def reply
		@new_comment = Comment.build_from(model, current_user.id, "")
		render
	end

	def current_user
		options[:context][:current_user]
	end

	def author
		User.find(user_id)
	end

	def comment_threads_count
		comment_threads.count == 0 ? "no" : comment_threads.count
	end

end
