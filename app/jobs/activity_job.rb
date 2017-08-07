class ActivityJob
  include SuckerPunch::Job
	include ActionView::Helpers::TextHelper

  def perform(owner_id, commentable_type, commentable_id, comment_id)
  	owner = User.find(owner_id)
		commentable = commentable_type.constantize.find(commentable_id)
		comment = Comment.find(comment_id)
		followers = commentable.followers.reject!{ |follower| follower == owner.person }
		followers.each do |follower|
			commentable.create_activity(key: "#{commentable.class.name.downcase}.commented_on", :owner => owner,:recipient => follower.user , params: {comment: truncate(comment.body, length: 150)}) 
		end
  end
end
