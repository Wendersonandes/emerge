# == Schema Information
#
# Table name: prizes
#
#  id             :integer          not null, primary key
#  grant_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  value_centavos :integer          default(0), not null
#  value_currency :string(255)      default("BRL"), not null
#  description    :text
#  exact_value    :boolean          default(TRUE)
#  opportunity_id :integer
#

class Prize < ActiveRecord::Base
	belongs_to :grant, :inverse_of => :prizes
	belongs_to :opportunity, :inverse_of => :prizes
	register_currency :brl
 	monetize :value_centavos, with_model_currency: :value_currency

 	acts_as_taggable
  acts_as_taggable_on :prize_types
  
end
