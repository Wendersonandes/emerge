class EntryManner < ActiveRecord::Base
  belongs_to :opportunity

	enum entry_type: { correios: 0, online: 1, email: 2, indicacao: 3, nao_definido: 4 }
	validates :entry_type, :presence => true
end
