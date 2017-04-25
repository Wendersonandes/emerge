# == Schema Information
#
# Table name: addresses
#
#  id                :integer          not null, primary key
#  addressable_id    :integer
#  addressable_type  :string(255)
#  formatted_address :string(255)
#  zip_code          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  latitude          :float
#  longitude         :float
#  neighborhood      :string(255)
#  street            :string(255)
#  number_address    :string(6)
#  complement        :string(50)
#  country_id        :integer
#  state_id          :integer
#  city_id           :integer
#

class Address < ActiveRecord::Base

    belongs_to :country
    belongs_to :state
    belongs_to :city

  	belongs_to :addressable, polymorphic: true

  	has_many :attachments, :as => :attachable, :dependent => :destroy
  	accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true

  	def self.filter_by type
	    belongs_to type, :foreign_key => :addressable_id, :foreign_type => type.to_s.capitalize
	    where(:addressable_type => type.to_s.capitalize).joins(type).includes(:addressable)
  	end

    geocoded_by :formatted_address
    after_validation :geocode, :if => :formatted_address_changed?

  	reverse_geocoded_by :latitude, :longitude

    before_validation :sanitize_data

  private

  def sanitize_data
    sanitize_formatted_address
    sanitize_zip_code
    sanitize_neighborhood
    sanitize_street
    sanitize_number_address
    sanitize_complement
  end

  def sanitize_formatted_address
    self.formatted_address = self.formatted_address.strip unless self.formatted_address.blank?
  end

  def sanitize_zip_code
    self.zip_code = self.zip_code.strip unless self.zip_code.blank?
  end

  def sanitize_neighborhood
    self.neighborhood = self.neighborhood.strip unless self.neighborhood.blank?
  end

  def sanitize_street
    self.street = self.street.strip unless self.street.blank?
  end

  def sanitize_number_address
    self.number_address = self.number_address.strip unless self.number_address.blank?
  end

  def sanitize_complement
    self.complement = self.complement.strip unless self.complement.blank?
  end


end
