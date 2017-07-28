# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  fullname           :string(255)
#  sumary             :string(255)
#  content            :text
#  beginning_activity :date
#  end_activity       :date
#  email              :string(255)
#  website            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  sigla              :string(255)
#  profile_type       :integer
#  user_id            :integer
#  first_name         :string
#  last_name          :string
#  art_statment       :text
#  short_bio          :string
#

class Person < ActiveRecord::Base
	self.table_name = 'profiles'

	acts_as_follower
  acts_as_followable

  belongs_to :user

  has_many :avatars, :foreign_key => "profile_id", :dependent => :delete_all
  accepts_nested_attributes_for :avatars, :reject_if => :all_blank, :allow_destroy => true

  acts_as_taggable
  acts_as_taggable_on :profile_types, :profile_skills

   # Returns a string of the objects class name downcased.
  def downcased_class_name(obj)
    obj.class.to_s.downcase
  end

  def capitalize_class_name(obj)
    obj.class.to_s.capitalize
  end


end

