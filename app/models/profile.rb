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

class Profile < ActiveRecord::Base
	scope :without_address, -> { joins(%Q{LEFT JOIN addresses ON addresses.addressable_id=profiles.id AND addresses.addressable_type='Profile'}).
  where('addresses.id IS NULL') }
	include PgSearch
	pg_search_scope :search,
	:against => [:name, :content],
	:using => {
		tsearch: {
                    dictionary: 'portuguese'
                  },
        :trigram => {:threshold => 0.2}
                  },
    :ignoring => :accents

	has_many :attachments, :as => :attachable, :dependent => :destroy
	accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :user

	has_many :program_responsibles
	has_many :programs, :through => :program_responsibles

	has_many :opportunity_selecteds
	has_many :opportunities, :through => :opportunity_selecteds

	# has_one :address, :as => :addressable
	# accepts_nested_attributes_for :address, :reject_if => :all_blank, :allow_destroy => true
  # has_many :addresses, :as => :addressable
  # accepts_nested_attributes_for :addresses, :reject_if => proc { |a| a['formatted_address'].blank? || a['number_address'].blank? || a['neighborhood'].blank? || a['state'].blank? || a['zip_code'].blank?}


	acts_as_taggable
  acts_as_taggable_on :profile_type
  
end
