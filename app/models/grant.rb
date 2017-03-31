# == Schema Information
#
# Table name: grants
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  quantity       :integer          default(1)
#  opportunity_id :integer
#  row_order      :integer
#

class Grant < ActiveRecord::Base
	include RankedModel

	default_scope{ order("row_order ASC")}

	ranks :row_order,
  :column => :row_order,
	:with_same => :opportunity_id

	belongs_to :opportunity, :inverse_of => :grants
	has_many :prizes, :inverse_of => :grant, :dependent => :delete_all
	accepts_nested_attributes_for :prizes, :reject_if => :all_blank, :allow_destroy => true

end
