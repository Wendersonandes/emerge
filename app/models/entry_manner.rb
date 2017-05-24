class EntryManner < ActiveRecord::Base
  belongs_to :opportunity
	enum entry_type: { correios: 0, online: 1, email: 2, indicação: 3, não_definido: 4, correios_ou_internet: 5 }

	validates :entry_type, :presence => true
end
