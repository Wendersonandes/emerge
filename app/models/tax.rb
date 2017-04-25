# == Schema Information
#
# Table name: taxes
#
#  id             :integer          not null, primary key
#  opportunity_id :integer
#  description    :text
#  value_centavos :integer          default(0), not null
#  value_currency :string(255)      default("BRL"), not null
#  tax_type       :integer
#

class Tax < ActiveRecord::Base
  belongs_to :opportunity
  register_currency :brl
  monetize :value_centavos, with_model_currency: :value_currency
  enum tax_type: { inscrição: 0, participação: 1, manutenção: 2, não_definido: 4 }
end
