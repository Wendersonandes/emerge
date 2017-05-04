# == Schema Information
#
# Table name: programs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  start_activity :datetime
#  end_activity   :datetime
#  program_type   :integer
#  email          :string(255)
#  url            :string(255)
#

class Program < ActiveRecord::Base
	scope :without_responsible, ->{ where("(select count(*) from program_responsibles where program_id=programs.id) = 0") }
	scope :without_tags, -> { joins(%Q{LEFT JOIN taggings ON taggings.taggable_id=programs.id AND taggings.taggable_type='Program'}).
  where('taggings.id IS NULL') }
	has_many :opportunity

	has_many :program_responsibles
	has_many :responsibles, :class_name => "Profile",:foreign_key => "profile_id", :through => :program_responsibles

	has_one :address, :as => :addressable
	accepts_nested_attributes_for :address, :reject_if => :all_blank, :allow_destroy => true

	acts_as_taggable
  acts_as_taggable_on :categories, :program_types

  acts_as_followable

end