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

  has_one :address, :as => :addressable, :dependent => :destroy
  accepts_nested_attributes_for :address

  has_many :likes, dependent: :destroy
  has_many :liked_opportunities, through: :likes, source: :likeable, source_type: "Opportunity"

  def recommends(opportunity)
    add_like_to(opportunity.class.to_s, opportunity.id)
  end

  def stop_recommended(opportunity)
    remove_like_from(opportunity, user.person)
  end

  def liked?(likeable_obj)
    likeable_obj.likes.present? ? true : false
  end

  def add_like_to(likeable_obj, likeable_id)
    likes.where(likeable_type: likeable_obj, likeable_id: likeable_id).first_or_create
  end

  def remove_like_from(likeable_obj, person_obj)
    likes.where(likeable_type: likeable_obj.class.to_s, likeable_id: likeable_obj.id, person_id: person_obj.id).destroy_all
  end

   # Returns a string of the objects class name downcased.
  def downcased_class_name(obj)
    obj.class.to_s.downcase
  end

  def capitalize_class_name(obj)
    obj.class.to_s.capitalize
  end


end

