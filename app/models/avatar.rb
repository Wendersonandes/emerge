# == Schema Information
#
# Table name: avatars
#
#  id          :integer          not null, primary key
#  profile_id  :integer
#  use_this    :boolean          default(FALSE)
#  avatar_data :text
#  priority    :integer
#

class Avatar < ActiveRecord::Base
	include RankedModel
	belongs_to :person, :foreign_key => "profile_id"

	default_scope{ order("priority ASC")}

	include AvatarUploader[:avatar]

	ranks :row_order,
  :column => :priority,
	:with_same => :profile_id


	scope :profile_avatars, lambda { |person|
  where(:profile_id => person.id)
  }
end
